import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:juliotati/core/router/app_tab.dart';

@immutable
class NotFount extends StatelessWidget {
  const NotFount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '"PICK UP A SHOVEL AND DO SOMETHING!"',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 20),
            FilledButton(
              onPressed: () => context.go(AppTab.home.path),
              child: const Text('Be my babe'),
            ),
          ],
        ),
      ),
    );
  }
}
