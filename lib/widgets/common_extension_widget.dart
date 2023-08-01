import 'package:flutter/material.dart';

extension WidgetCenterX on Widget {

  Widget center() =>
      Center(child: this);

  Widget centerRight() =>
      Align(alignment: Alignment.centerRight, child: this);

  Widget topRight() =>
      Align(alignment: Alignment.topRight, child: this);

  Widget bottomRight() =>
      Align(alignment: Alignment.bottomRight, child: this);
}