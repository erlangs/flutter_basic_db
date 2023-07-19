import 'package:flutter/material.dart';

class InkWellButton extends StatelessWidget {

  InkWellButton({
    super.key,
    this.padding,
    Color? color,
    Decoration? decoration,
    this.width,
    this.height,
    this.child,
    this.onTap
  }) : decoration = decoration ?? (color != null ? BoxDecoration(color: color) : null);

  final EdgeInsetsGeometry? padding;

  final Decoration? decoration;

  final double? width;

  final double? height;

  final Widget? child;

  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Ink(
        padding: this.padding,
        decoration: this.decoration,
        width: this.width,
        height: this.height,
        child: InkWell(
          onTap: this.onTap,
          child: this.child,
        ),
      ),
    );
  }
  
}