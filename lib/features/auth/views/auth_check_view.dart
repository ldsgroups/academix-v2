import 'package:academix/core/constants/asset_constants.dart';
import 'package:academix/core/router/router_naming.dart';
import 'package:academix/features/auth/viewmodel/auth_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthCheckView extends HookConsumerWidget {
  const AuthCheckView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;

    void _redirectTo(String path) {
      context.pushReplacementNamed(path);
    }

    Future<void> _checkAuthState() async {
      final _usr = ref.read(authViewModelProvider.notifier).currentUser();

      if (_usr != null && _usr.isNotEmpty) {
        final _isStudentDataInitialized = await ref
            .read(authViewModelProvider.notifier)
            .isStudentDataInitialized(userId: _usr);

        if (_isStudentDataInitialized) {
          return _redirectTo(RouteName.home);
        } else {
          return _redirectTo(RouteName.completeStudentProfile);
        }
      } else {
        return _redirectTo(RouteName.signIn);
      }
    }

    useEffect(
      () {
        _checkAuthState();
        return null;
      },
      const [],
    );

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AssetConstants.listenImg,
              width: 110,
              height: 200,
            ),
            Text(
              'Academix',
              style: textTheme.titleLarge,
            ),
            Text(
              'Votre partenaire éducatif',
              style: textTheme.labelSmall,
            ),
            const SizedBox(height: 12),
            const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeAlign: BorderSide.strokeAlignInside,
                strokeWidth: 2,
                semanticsValue: 'Loading',
                semanticsLabel: 'Loading',
                strokeCap: StrokeCap.butt,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
