import 'package:academix/core/router/router.dart' show RouteName;
import 'package:academix/features/auth/views/auth_check_view.dart';
import 'package:academix/features/auth/views/complete_student_profile_view.dart';
import 'package:academix/features/auth/views/sign_in_view.dart';
import 'package:academix/features/auth/views/sign_up_view.dart';
import 'package:academix/features/chat/views/chat_view.dart';
import 'package:academix/features/favorite/views/favorite_view.dart';
import 'package:academix/features/home/views/home_view.dart';
import 'package:academix/features/not_found_view.dart';
import 'package:academix/features/profile/views/profile_view.dart';
import 'package:academix/features/scaffold_with_bottom_navbar.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router_config.g.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _sectionNavigatorKey = GlobalKey<NavigatorState>();
// GoRouter? _previousR;

@riverpod
GoRouter router(RouterRef ref) {
  final r = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/auth-check',
    // initialLocation: _previousR?.routerDelegate.currentConfiguration.fullPath,
    // debugLogDiagnostics: true,
    routes: <RouteBase>[
      GoRoute(
        path: '/sign-in',
        name: RouteName.signIn,
        builder: (_, __) => const SignInView(),
      ),
      GoRoute(
        path: '/sign-up',
        name: RouteName.signUp,
        builder: (_, __) => const SignUpView(),
      ),
      GoRoute(
        path: '/auth-check',
        name: RouteName.authCheck,
        builder: (_, __) => const AuthCheckView(),
      ),
      GoRoute(
        path: '/complete-student-profile',
        name: RouteName.completeStudentProfile,
        builder: (_, __) => const CompleteStudentProfileView(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return ScaffoldWithBottomNavbar(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _sectionNavigatorKey,
            routes: <RouteBase>[
              GoRoute(
                path: '/home',
                name: RouteName.home,
                builder: (_, __) => const HomeView(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: '/chat',
                name: RouteName.chat,
                builder: (_, __) => const ChatView(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: '/favorite',
                name: RouteName.favorite,
                builder: (_, __) => const FavoriteView(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: '/profile',
                name: RouteName.profile,
                builder: (_, __) => const ProfileView(),
              ),
            ],
          ),
        ],
      ),
    ],
    errorBuilder: (_, __) => const NotFoundView(),
  );

  ref.onDispose(r.dispose);
  return r;
}
