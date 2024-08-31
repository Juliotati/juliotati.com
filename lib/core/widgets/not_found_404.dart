// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:juliotati/core/links.dart';

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
              onPressed: () => window.location.replace(Links.myWebsite),
              child: const Text('Be my babe'),
            ),
          ],
        ),
      ),
    );
  }
}
