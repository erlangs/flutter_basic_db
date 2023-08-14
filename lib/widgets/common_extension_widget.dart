import 'package:flutter/material.dart';

extension WidgetCenterX on Widget {

  Widget expanded() => Expanded(child: this);

  Widget center() =>
      Center(child: this);

  Widget centerRight() =>
      Align(alignment: Alignment.centerRight, child: this);

  Widget topRight() =>
      Align(alignment: Alignment.topRight, child: this);

  Widget bottomRight() =>
      Align(alignment: Alignment.bottomRight, child: this);

  Widget topLeft() =>
      Align(alignment: Alignment.topLeft, child: this);

  Widget centerLeft() =>
      Align(alignment: Alignment.centerLeft, child: this);

  Widget bottomLeft() =>
      Align(alignment: Alignment.bottomLeft, child: this);

  Widget positioned({ double? left, double? top, double? right, double? bottom, double? width, double? height }) =>
      Positioned(left: left, top: top, right: right, bottom: bottom, width: width, height: height, child: this);

  Widget backgroundColor(Color color) =>
      Container(color: color, child: this);

  Widget sizedBox({double? width, double? height}) =>
      SizedBox(width: width, height: height, child: this);

  Widget wellButton({ padding, Color? color, Decoration? decoration, shape, width, height, onTap }) =>
      Material(
          color: Colors.transparent,
          child:
          Ink(
              padding: padding, decoration: decoration ?? (color != null ? BoxDecoration(color: color) : null), width: width, height: height,
              child: InkWell(
                  customBorder: shape ?? RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  onTap: onTap, child: this))
      );
}