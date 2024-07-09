import 'package:academix/core/commons/commons.dart';
import 'package:academix/features/auth/viewmodel/user_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthGuard extends ConsumerWidget {
  const AuthGuard({
    super.key,
    required this.fallbackRoute,
    required this.child,
  });

  final String fallbackRoute;
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(userStateNotifierProvider);
    return Guard(
      canActivate: authState
          .maybeMap(
            data: (user) async => user.value != null,
            orElse: () async => false,
          )
          .then((result) => result),
      fallbackRoute: fallbackRoute,
      child: child,
    );
  }
}
