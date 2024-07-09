import 'dart:io';

import 'package:academix/core/core.dart';
import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'auth_remote_repository.g.dart';

@riverpod
AuthRemoteRepository authRemoteRepository(
  AuthRemoteRepositoryRef ref,
) =>
    AuthRemoteRepository(
      goTrueClient: ref.watch(supabaseAuthProvider),
      db: ref.watch(supabaseClientProvider),
    );

abstract class IAuthRemoteRepository {
  String? currentUserId();

  FutureEither<String?> signUpWithEmailAndPassword({
    required String fullName,
    required String email,
    required String password,
  });

  FutureEither<String?> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  FutureEither<String?> signInWithOAuth({
    required CsOAuthProvider provider,
    String? webClientId,
    String? iosClientId,
  });

  FutureEitherVoid signOut();

  FutureEither<bool> isStudentDataInitialized({required String userId});
}

class AuthRemoteRepository implements IAuthRemoteRepository {
  AuthRemoteRepository({
    required GoTrueClient goTrueClient,
    required SupabaseClient db,
  })  : _goTrueClient = goTrueClient,
        _db = db;

  final GoTrueClient _goTrueClient;
  final SupabaseClient _db;

  @override
  String? currentUserId() => _goTrueClient.currentSession?.user.id;

  @override
  FutureEither<String?> signUpWithEmailAndPassword({
    required String fullName,
    required String email,
    required String password,
  }) async {
    try {
      final response = await _goTrueClient.signUp(
        email: email,
        password: password,
        data: {'full_name': fullName},
        emailRedirectTo: 'io.ldsgroups.academix://confirmation-callback/',
      );

      return right(response.user?.id);
    } on AuthException catch (err) {
      if (kDebugMode) {
        print('[E_POSTGRES] ${err.message}');
      }
      return left(
        ServerFailure(errorMessage: supabaseErrorHandler(authError: err)),
      );
    } catch (e) {
      if (kDebugMode) {
        print('[E_LOCAL] $e');
      }
      return left(
        ServerFailure(
          errorMessage: 'Une erreur est survenue',
        ),
      );
    }
  }

  @override
  FutureEither<String?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _goTrueClient.signInWithPassword(
        email: email,
        password: password,
      );

      return right(response.user?.id);
    } on AuthException catch (err) {
      if (kDebugMode) {
        print('[E_POSTGRES] ${err.message}');
      }
      return left(
        ServerFailure(errorMessage: supabaseErrorHandler(authError: err)),
      );
    } catch (e) {
      if (kDebugMode) {
        print('[E_LOCAL] $e');
      }
      return left(
        ServerFailure(
          errorMessage: 'Une erreur est survenue',
        ),
      );
    }
  }

  Future<String?> _nativeGoogleSignIn({
    required String webClientId,
    required String iosClientId,
  }) async {
    final googleSignIn = GoogleSignIn(
      clientId: iosClientId,
      serverClientId: webClientId,
    );
    final googleUser = await googleSignIn.signIn();
    final googleAuth = await googleUser!.authentication;
    final accessToken = googleAuth.accessToken;
    final idToken = googleAuth.idToken;

    if (accessToken == null) {
      throw Exception('No Access Token found.');
    }
    if (idToken == null) {
      throw Exception('No ID Token found.');
    }

    final response = await _goTrueClient.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: accessToken,
    );

    return response.user?.id;
  }

  @override
  FutureEither<String?> signInWithOAuth({
    required CsOAuthProvider provider,
    String? webClientId,
    String? iosClientId,
  }) async {
    try {
      final _provider = switch (provider) {
        CsOAuthProvider.google => OAuthProvider.google,
        CsOAuthProvider.facebook => OAuthProvider.facebook,
      };

      String? _userId;

      if (!kIsWeb && (Platform.isAndroid || Platform.isIOS)) {
        _userId = await _nativeGoogleSignIn(
          webClientId: webClientId!,
          iosClientId: iosClientId!,
        );
      } else {
        await _goTrueClient.signInWithOAuth(_provider);
      }

      // await _goTrueClient.signInWithOAuth(_provider);
      return right(_userId);
    } on AuthException catch (err) {
      if (kDebugMode) {
        print('[E_POSTGRES] ${err.message}');
      }
      return left(
        ServerFailure(errorMessage: supabaseErrorHandler(authError: err)),
      );
    } catch (e) {
      if (kDebugMode) {
        print('[E_LOCAL] $e');
      }
      return left(
        ServerFailure(
          errorMessage: 'Une erreur est survenue',
        ),
      );
    }
  }

  @override
  FutureEitherVoid signOut() async {
    try {
      await _goTrueClient.signOut();
      return right(null);
    } on AuthException catch (err) {
      if (kDebugMode) {
        print('[E_POSTGRES] ${err.message}');
      }
      return left(
        ServerFailure(errorMessage: supabaseErrorHandler(authError: err)),
      );
    } catch (e) {
      if (kDebugMode) {
        print('[E_LOCAL] $e');
      }
      return left(
        ServerFailure(
          errorMessage: 'Une erreur est survenue',
        ),
      );
    }
  }

  @override
  FutureEither<bool> isStudentDataInitialized({required String userId}) async {
    try {
      final response = await _db.rpc<bool>(
        'is_student_data_initialized',
        params: {'current_user_id': userId},
      );
      return right(response);
    } on AuthException catch (err) {
      if (kDebugMode) {
        print('[E_POSTGRES] ${err.message}');
      }
      return left(
        ServerFailure(errorMessage: supabaseErrorHandler(authError: err)),
      );
    } catch (e) {
      if (kDebugMode) {
        print('[E_LOCAL] $e');
      }
      return left(
        ServerFailure(
          errorMessage: 'Une erreur est survenue',
        ),
      );
    }
  }
}
