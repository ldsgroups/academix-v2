import 'package:academix/core/core.dart';
import 'package:academix/features/auth/repositories/auth_remote_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_viewmodel.g.dart';

@riverpod
bool userState(UserStateRef ref) {
  final res = ref.read(authViewModelProvider.notifier).currentUser();
  return res != null && res.isNotEmpty;
}

@riverpod
class AuthViewModel extends _$AuthViewModel {
  late AuthRemoteRepository _authRemoteRepository;

  // late CurrentUserNotifier _currentUserNotifier;

  @override
  AsyncValue<String>? build() {
    _authRemoteRepository = ref.watch(authRemoteRepositoryProvider);
    // _currentUserNotifier = ref.watch(currentUserNotifierProvider);

    return null;
  }

  String? currentUser() {
    // state = const AsyncValue.loading();
    final res = _authRemoteRepository.currentUserId();
    // state = AsyncValue.data(res ?? '');
    return res;
  }

  Future<void> signUp({
    required String fullName,
    required String email,
    required String password,
  }) async {
    state = const AsyncValue.loading();
    final res = await _authRemoteRepository.signUpWithEmailAndPassword(
      fullName: fullName,
      email: email,
      password: password,
    );

    final val = switch (res) {
      Left(value: final l) => state = AsyncValue.error(l, StackTrace.current),
      Right(value: final r) => state = AsyncValue.data(r ?? ''),
    };
    if (kDebugMode) {
      print(val);
    }
  }

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    state = const AsyncValue.loading();
    final res = await _authRemoteRepository.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    final val = switch (res) {
      Left(value: final l) => state = AsyncValue.error(l, StackTrace.current),
      Right(value: final r) => state = AsyncValue.data(r ?? ''),
    };
    if (kDebugMode) {
      print(val);
    }
  }

  Future<void> signInWithOAuth({
    required CsOAuthProvider provider,
    String? webClientId,
    String? iosClientId,
  }) async {
    state = const AsyncValue.loading();
    final res = await _authRemoteRepository.signInWithOAuth(
      provider: provider,
      webClientId: webClientId,
      iosClientId: iosClientId,
    );

    final val = switch (res) {
      Left(value: final l) => state = AsyncValue.error(l, StackTrace.current),
      Right(value: final r) => state = AsyncValue.data(r ?? ''),
    };
    if (kDebugMode) {
      print(val);
    }
  }

  Future<void> signOut() async {
    state = const AsyncValue.loading();
    final res = await _authRemoteRepository.signOut();

    final val = switch (res) {
      Left(value: final l) => state = AsyncValue.error(l, StackTrace.current),
      Right() => state = const AsyncValue.data(''),
    };
    if (kDebugMode) {
      print(val);
    }
  }

  Future<bool> isStudentDataInitialized({required String userId}) async {
    // state = const AsyncValue.loading();
    final res = await _authRemoteRepository.isStudentDataInitialized(
      userId: userId,
    );

    final val = switch (res) {
      Left(value: final l) => state = AsyncValue.error(l, StackTrace.current),
      Right(value: final r) => AsyncValue.data(r.toString()),
    };

    if (kDebugMode) {
      print(val);
    }

    if (val.value == 'true') {
      return true;
    } else {
      return false;
    }
  }
}
