import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/diagnostics.dart';
import '../utils/app_theme.dart';
import 'common_widgets.dart';

AppBar CommonAppBar({ required BuildContext context, String? titleText, List<Widget>?actions }) {
  return AppBar(
    backgroundColor: appBarBgColor,
    foregroundColor: Colors.black,
    centerTitle: true,
    title: Text(
      titleText ?? "",
      style: Theme.of(context).textTheme.titleLarge!.override(
          fontSize: e18,
          fontWeight: FontWeight.w600,
          color: Colors.black),
    ),
    elevation: 0,
    actions: actions,
  );
}