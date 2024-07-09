import 'package:academix/core/core.dart';
import 'package:academix/core/router/router.dart';
import 'package:academix/features/auth/viewmodel/auth_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignInView extends HookConsumerWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    final _formKey = GlobalKey<FormState>();
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    final isLoading = ref.watch(
      // TODO: set to false later
      authViewModelProvider.select((val) => val?.isLoading ?? false),
    );

    void _redirectTo(String path) {
      context.pushReplacementNamed(path);
    }

    Future<void> _isStudentDataInitialized({required String userId}) async {
      final response = await ref
          .read(authViewModelProvider.notifier)
          .isStudentDataInitialized(userId: userId);

      if (response) {
        return _redirectTo(RouteName.home);
      } else {
        return _redirectTo(RouteName.completeStudentProfile);
      }
    }

    ref.listen(
      authViewModelProvider,
      (_, next) {
        next?.when(
          data: (r) => _isStudentDataInitialized(userId: r),
          error: (error, st) {
            final _error = error as ServerFailure;
            passwordController.clear();
            showSnackBar(context, _error.errorMessage);
          },
          loading: () {},
        );
      },
    );

    Future<void> signInWithEmailAndPassword() async {
      await ref.read(authViewModelProvider.notifier).signIn(
            email: emailController.text,
            password: passwordController.text,
          );
    }

    Future<void> signInWithOAuth({
      required CsOAuthProvider provider,
      String? webClientId,
      String? iosClientId,
    }) async {
      await ref.read(authViewModelProvider.notifier).signInWithOAuth(
            provider: provider,
            webClientId: webClientId,
            iosClientId: iosClientId,
          );
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                Text('Rebonjour', style: textTheme.headlineLarge),
                const SizedBox(height: 5),
                Text.rich(
                  style: TextStyle(
                    color: colorScheme.onSurface.withOpacity(0.5),
                    fontStyle: FontStyle.italic,
                  ),
                  const TextSpan(
                    children: [
                      TextSpan(
                        text: 'Academix',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      TextSpan(text: ' vous souhaite un bon retour.\n'),
                      TextSpan(text: ' Identifier vous pour continuer'),
                    ],
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 40),
                      CsTextFormField(
                        controller: emailController,
                        hintText: 'Email',
                        keyboardType: TextInputType.emailAddress,
                        validator: (p0) {
                          if (p0 == null || p0.isEmpty) {
                            return "L'email est obligatoire";
                          }
                          final res = p0.isEmail();
                          if (!res) {
                            return "L'email n'est pas valide";
                          }

                          return null;
                        },
                      ),
                      const SizedBox(height: 12),
                      CsTextFormField(
                        controller: passwordController,
                        hintText: 'Mot de passe',
                        textInputAction: TextInputAction.done,
                        obscureText: true,
                        validator: (p0) {
                          if (p0 == null || p0.isEmpty) {
                            return 'Le mot de passe est obligatoire';
                          }
                          final res = p0.hasMinLength(8);
                          if (!res) {
                            return 'Le mot de passe doit contenir au moins 8 caractères';
                          }

                          return null;
                        },
                        onFieldSubmitted: (_) {
                          if (_formKey.currentState!.validate()) {
                            signInWithEmailAndPassword();
                          }
                        },
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Mot de passe oublié ?',
                            style: TextStyle(
                              color: colorScheme.primary,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      CsButton(
                        isLoading: isLoading,
                        isDisabled: isLoading,
                        text: 'Se connecter',
                        onPress: () {
                          if (_formKey.currentState!.validate()) {
                            signInWithEmailAndPassword();
                          }
                        },
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Pas de compte? ',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          TextButton(
                            onPressed: () => context.goNamed(RouteName.signUp),
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                            ),
                            child: Text(
                              'inscription',
                              style: TextStyle(
                                color: colorScheme.primary,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.underline,
                                decorationColor: colorScheme.primary,
                                decorationStyle: TextDecorationStyle.solid,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Row(
                  children: [
                    Expanded(child: Divider()),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text('OU'),
                    ),
                    Expanded(child: Divider()),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildOAuthButton(
                      isLoading: isLoading,
                      isDisabled: isLoading,
                      context: context,
                      text: 'Google',
                      iconPath: AssetConstants.googleSVG,
                      onPress: () => signInWithOAuth(
                        provider: CsOAuthProvider.google,
                        webClientId: dotenv.env['WEB_CLIENT_ID'],
                        iosClientId: dotenv.env['IOS_CLIENT_ID'],
                      ),
                    ),
                    const SizedBox(width: 12),
                    buildOAuthButton(
                      isLoading: isLoading,
                      isDisabled: isLoading,
                      context: context,
                      text: 'Facebook',
                      iconPath: AssetConstants.facebookSVG,
                      onPress: () => signInWithOAuth(
                        provider: CsOAuthProvider.facebook,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  OutlinedButton buildOAuthButton({
    required BuildContext context,
    required String text,
    required String iconPath,
    required VoidCallback onPress,
    bool isLoading = false,
    bool isDisabled = false,
  }) {
    final size = MediaQuery.sizeOf(context);

    return OutlinedButton.icon(
      onPressed: isDisabled ? null : onPress,
      label: Text(
        text,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
      icon: isLoading
          ? const CircularProgressIndicator(
              color: Colors.white,
              strokeAlign: BorderSide.strokeAlignInside,
              strokeWidth: 2,
              semanticsValue: 'Loading',
              semanticsLabel: 'Loading',
              strokeCap: StrokeCap.butt,
            )
          : SvgPicture.asset(iconPath, width: 24, height: 24),
      style: ButtonStyle(
        fixedSize: WidgetStatePropertyAll(Size(size.width * 0.4, 48)),
        shape: WidgetStatePropertyAll(roundedShape()),
      ),
    );
  }
}
