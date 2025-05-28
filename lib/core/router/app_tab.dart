import 'package:flutter/material.dart' show SelectionArea;
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:juliotati/core/extensions/build_context.dart';
import 'package:juliotati/core/widgets/not_found_404.dart';
import 'package:juliotati/pages/exports.dart';

enum AppTab {
  home(name: 'Home', path: '/'),
  notFound(name: 'Tasukete!!', path: '/404');

  const AppTab({required this.name, required this.path});

  bool get is404 => this == notFound;

  Widget get pageWidget {
    final child = switch (this) {
      home => const AppHomeScreen(),
      notFound => const NotFount(),
    };

    return _RootWrapperBody(
      key: Key('_RootWrapperBody<$name>'),
      tab: this,
      child: child,
    );
  }

  final String name;
  final String path;
}

class _RootWrapperBody extends StatefulWidget {
  const _RootWrapperBody({required this.child, required this.tab, super.key});

  final Widget child;
  final AppTab tab;

  @override
  State<_RootWrapperBody> createState() => _RootWrapperBodyState();
}

class _RootWrapperBodyState extends State<_RootWrapperBody> {
  AppTab get tab => widget.tab;

  Future<void> _updateAppTabBarLabel() async {
    SystemChrome.setApplicationSwitcherDescription(
      ApplicationSwitcherDescription(
        label: tab.is404 ? tab.name : '${context.i18n.myName} - ${tab.name}',
        primaryColor: context.theme.primaryColor.value,
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
