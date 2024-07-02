// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$supabaseClientHash() => r'36e9cae00709545a85bfe4a5a2cb98d8686a01ea';

/// See also [supabaseClient].
@ProviderFor(supabaseClient)
final supabaseClientProvider = AutoDisposeProvider<SupabaseClient>.internal(
  supabaseClient,
  name: r'supabaseClientProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$supabaseClientHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SupabaseClientRef = AutoDisposeProviderRef<SupabaseClient>;
String _$supabaseAuthHash() => r'f7cf7a81e8bf783b174b4804e37784ebcd06aa50';

/// See also [supabaseAuth].
@ProviderFor(supabaseAuth)
final supabaseAuthProvider = AutoDisposeProvider<GoTrueClient>.internal(
  supabaseAuth,
  name: r'supabaseAuthProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$supabaseAuthHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SupabaseAuthRef = AutoDisposeProviderRef<GoTrueClient>;
String _$supabaseStorageHash() => r'1a2d3d966d83c84f9a9677fa6652560966bbc78b';

/// See also [supabaseStorage].
@ProviderFor(supabaseStorage)
final supabaseStorageProvider =
    AutoDisposeProvider<SupabaseStorageClient>.internal(
  supabaseStorage,
  name: r'supabaseStorageProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$supabaseStorageHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SupabaseStorageRef = AutoDisposeProviderRef<SupabaseStorageClient>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
