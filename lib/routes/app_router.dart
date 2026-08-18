import 'package:easy_recap/core/app_constants.dart';
import 'package:easy_recap/features/dashboard/base_pages.dart';
import 'package:easy_recap/features/dashboard/views/activity_page.dart';
import 'package:easy_recap/features/dashboard/views/class_page.dart';
import 'package:easy_recap/features/dashboard/views/home_page.dart';
import 'package:easy_recap/features/dashboard/views/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    navigatorKey: _navigatorKey,
    initialLocation: AppRoutes.homeRoute.path,
    debugLogDiagnostics: true,
    routes: <RouteBase>[
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return BasePages(navigationShell: navigationShell);
        },
        branches: <StatefulShellBranch>[
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                name: AppRoutes.homeRoute.name,
                path: AppRoutes.homeRoute.path,
                builder: (context, state) => const HomePage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                name: AppRoutes.classRoute.name,
                path: AppRoutes.classRoute.path,
                builder: (context, state) => const ClassPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                name: AppRoutes.activityRoute.name,
                path: AppRoutes.activityRoute.path,
                builder: (context, state) => const ActivityPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                name: AppRoutes.settingsRoute.name,
                path: AppRoutes.settingsRoute.path,
                builder: (context, state) => const SettingPage(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
