import 'package:flutter/material.dart';

class TextCustom extends StatelessWidget {
  const TextCustom(
      {super.key,
      required this.child,
      this.left,
      this.right,
      this.top,
      this.bottom});
  final double? left;
  final double? right;
  final double? top;
  final double? bottom;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.fromLTRB(left ?? 0, top ?? 0, right ?? 0, bottom ?? 0),
      child: child,
    );
  }
}
