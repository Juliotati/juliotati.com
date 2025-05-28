import 'package:flutter/cupertino.dart';

@immutable
class AppPadding extends StatelessWidget {
  const AppPadding({required this.child, required this.padding, super.key});

  final Widget child;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      duration: const Duration(milliseconds: 400),
      padding: padding,
      child: child,
    );
  }
}
