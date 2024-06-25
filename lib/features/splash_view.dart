import 'package:academix/core/router/router_naming.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SplashView extends HookConsumerWidget {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const duration = Duration(seconds: 2);

    useEffect(
      () {
        Future.delayed(duration, () {
          context.goNamed(RouteName.home);
        });

        return null;
      },
      const [],
    );

    return const Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('Academix'),
            CircularProgressIndicator.adaptive(),
          ],
        ),
      ),
    );
  }
}
