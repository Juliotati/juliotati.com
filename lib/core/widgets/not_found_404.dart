import 'package:flutter/material.dart';
import 'package:juliotati/core/links.dart';
import 'package:web/web.dart' as web;

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
              onPressed: () => web.window.location.replace(Links.app),
              child: const Text('Be my babe'),
            ),
          ],
        ),
      ),
    );
  }
}
