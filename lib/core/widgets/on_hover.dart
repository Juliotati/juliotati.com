import 'package:flutter/material.dart';

@immutable
class OnHover extends StatefulWidget {
  const OnHover({required this.builder, super.key});

  final Widget Function(bool isHovering) builder;

  @override
  State<OnHover> createState() => _OnHoverState();
}

class _OnHoverState extends State<OnHover> {
  bool _isHovering = false;

  void _onHover(PointerEvent event) {
    setState(() => _isHovering = true);
  }

  void _onExit(PointerEvent event) {
    setState(() => _isHovering = false);
  }

  @override
  void dispose() {
    _isHovering = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: _onHover,
      onExit: _onExit,
      child: widget.builder(_isHovering),
    );
  }
}
