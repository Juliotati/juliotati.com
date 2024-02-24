library home;

import 'dart:async';
import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:juliotati/core/extensions/build_context.dart';
import 'package:juliotati/core/links.dart';
import 'package:juliotati/core/widgets/on_hover.dart';
import 'package:juliotati/gen/assets.gen.dart';
import 'package:url_launcher/url_launcher.dart';

part 'widgets/actionable_values.dart';

part 'widgets/extended_bio.dart';

part 'widgets/footer.dart';

part 'widgets/short_bio.dart';

@immutable
class AppHomeScreen extends StatelessWidget {
  const AppHomeScreen({super.key});

  List<Widget> get _homePageItems {
    return [
      const _ShortBio(key: Key('short_bio')),
      const _ExtendedBio(key: Key('extended_bio')),
      const _ActionableValues(key: Key('actionable_values')),
      const _FooterLinks(key: Key('footer_links')),
      const _Footer(key: Key('app_footer')),
    ];
  }

  static final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final horizontalPadding = switch (constraints.maxWidth) {
              < 800 => 0.0,
              < 1300 => 50.0,
              < 1800 => 120.0,
              _ => 150.0,
            };
            return ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              controller: _scrollController,
              physics: const BouncingScrollPhysics(),
              itemCount: _homePageItems.length,
              itemBuilder: (context, index) {
                return _homePageItems[index];
              },
            );
          },
        ),
      ),
    );
  }
}

@immutable
class _PageAutoPadding extends StatelessWidget {
  const _PageAutoPadding({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final smallWindow = constraints.maxWidth < 600;
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: smallWindow ? 20.0 : 40.0),
          child: child,
        );
      },
    );
  }
}
