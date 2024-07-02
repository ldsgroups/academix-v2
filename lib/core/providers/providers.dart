import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'providers.g.dart';

// Supabase
@riverpod
SupabaseClient supabaseClient(SupabaseClientRef ref) {
  return Supabase.instance.client;
}

@riverpod
GoTrueClient supabaseAuth(SupabaseAuthRef ref) {
  final client = ref.watch(supabaseClientProvider);

  return client.auth;
}

@riverpod
SupabaseStorageClient supabaseStorage(SupabaseStorageRef ref) {
  final client = ref.watch(supabaseClientProvider);

  return client.storage;
}
