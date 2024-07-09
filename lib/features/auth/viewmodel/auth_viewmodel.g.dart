// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userStateHash() => r'2df612cab91c4eb74b439556af119c2f150610d1';

/// See also [userState].
@ProviderFor(userState)
final userStateProvider = AutoDisposeProvider<bool>.internal(
  userState,
  name: r'userStateProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserStateRef = AutoDisposeProviderRef<bool>;
String _$authViewModelHash() => r'd116129361b2ac0c7af80b663f56fee6c9103350';

/// See also [AuthViewModel].
@ProviderFor(AuthViewModel)
final authViewModelProvider =
    AutoDisposeNotifierProvider<AuthViewModel, AsyncValue<String>?>.internal(
  AuthViewModel.new,
  name: r'authViewModelProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authViewModelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AuthViewModel = AutoDisposeNotifier<AsyncValue<String>?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
