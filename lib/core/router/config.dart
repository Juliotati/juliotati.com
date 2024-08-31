import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:juliotati/core/router/app_tab.dart';
import 'package:link_target/link_target.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: AppTab.home.path,
  errorBuilder: (_, __) => AppTab.notFound.pageWidget,
  routes: <RouteBase>[
    ShellRoute(
      restorationScopeId: 'MainWrapper<root>',
      builder: (_, __, child) => LinkTargetRegion(child: child),
      routes: [
        for (final tab in AppTab.values)
          GoRoute(
            path: tab.path,
            name: tab.name,
            builder: (_, __) => tab.pageWidget,
          ),
      ],
    ),
  ],
);
