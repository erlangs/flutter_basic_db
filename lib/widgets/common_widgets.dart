import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';

double e10 = 10;
double e18 = 18;
double e28 = 28;
double e45 = 45;
double e58 = 58;
double e100 = 100;

Color appBlueColor = const Color(0xFF5895F3);
Color appBarBgColor = const Color(0xFFF7F8FC);

const String appPersonPngBase64 = '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';
Uint8List appPersonPng = base64Decode(appPersonPngBase64);

Widget heightSpace(double height) {
  return SizedBox(
    height: height,
  );
}

Widget widthSpace(double width) {
  return SizedBox(
    width: width,
  );
}
