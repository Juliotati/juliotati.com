import 'package:flutter/widgets.dart';
import 'package:juliotati/pages/exports.dart';

enum AppTab {
  home(
    name: 'Home',
    path: '/',
  );

  const AppTab({required this.name, required this.path});

  Widget get pageWidget {
    return switch (this) {
      AppTab.home => const AppHomeScreen(),
    };
  }

  final String name;
  final String path;
}
