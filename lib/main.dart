import 'package:academix/core/router/router.dart';
import 'package:academix/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kinde_flutter_sdk/kinde_flutter_sdk.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  await KindeFlutterSDK.initializeSDK(
    authDomain: dotenv.env['KINDE_AUTH_DOMAIN']!,
    authClientId: dotenv.env['KINDE_AUTH_CLIENT_ID']!,
    loginRedirectUri: dotenv.env['KINDE_LOGIN_REDIRECT_URI']!,
    logoutRedirectUri: dotenv.env['KINDE_LOGOUT_REDIRECT_URI']!,
    audience: dotenv.env['KINDE_AUDIENCE'],
    scopes: ['email', 'profile', 'offline', 'openid'],
  );

  runApp(const ProviderScope(child: CoreApp()));
}

class CoreApp extends ConsumerWidget {
  const CoreApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    final brightness = View.of(context).platformDispatcher.platformBrightness;
    final textTheme = createTextTheme(context, 'Open Sans', 'Poppins');
    final theme = MaterialTheme(textTheme);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Academix',
      restorationScopeId: 'app',
      theme: brightness == Brightness.light ? theme.light() : theme.dark(),
      routerConfig: router,
    );
  }
}
