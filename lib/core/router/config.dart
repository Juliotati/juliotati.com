import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:juliotati/core/router/app_tab.dart';
import 'package:juliotati/translations/l10n.dart';
import 'package:link_target/link_target.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: AppTab.home.path,
  errorBuilder: (context, _) => Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '"Pick up a shovel and ddo something"',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          ElevatedButton(
            onPressed: () => context.go('/'),
            child: const Text('Be my babe'),
          ),
        ],
      ),
    ),
  ),
  routes: <RouteBase>[
    ShellRoute(
      restorationScopeId: 'MainWrapper<root>',
      builder: (context, state, child) => LinkTargetRegion(child: child),
      routes: [
        for (final tab in AppTab.values)
          GoRoute(
            path: tab.path,
            builder: (_, __) => _RootWrapperBody(
              key: Key('_RootWrapperBody<${tab.name}>'),
              tab: tab,
              child: tab.pageWidget,
            ),
          ),
      ],
    ),
  ],
);

class _RootWrapperBody extends StatefulWidget {
  const _RootWrapperBody({
    required this.child,
    required this.tab,
    super.key,
  });

  final Widget child;
  final AppTab tab;

  @override
  State<_RootWrapperBody> createState() => _RootWrapperBodyState();
}

class _RootWrapperBodyState extends State<_RootWrapperBody> {
  Future<void> _updateAppTabBarLabel() async {
    SystemChrome.setApplicationSwitcherDescription(
      ApplicationSwitcherDescription(
        label: '${AppLocal.current.myName} - ${widget.tab.name}',
        primaryColor: Theme.of(context).primaryColor.value,
      ),
    );
  }

  @override
  void didChangeDependencies() {
    _updateAppTabBarLabel();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SelectionArea(child: widget.child);
  }
}
