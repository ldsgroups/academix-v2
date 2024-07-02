import 'package:academix/core/router/router.dart' show RouteName;
import 'package:academix/features/auth/viewmodel/auth_viewmodel.dart';
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

@riverpod
GoRouter router(RouterRef ref) {
  final authState = ref.watch(currentUserIdProvider);

  final r = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/home',
    // debugLogDiagnostics: true,
    routes: <RouteBase>[
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
    redirect: (context, state) {
      authState.when(
        error: (_, __) => null,
        loading: () => null,
        data: (isAuthenticated) {
          print('IS AUTH: ${isAuthenticated ?? 'false'}');
          switch (isAuthenticated) {
            case null:
              return '/login';
            case '':
              return '/login';
            default:
              return '/home';
          }
        },
      );
    },
  );

  ref.onDispose(r.dispose);
  return r;
}
