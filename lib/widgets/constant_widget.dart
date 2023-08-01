
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';



Widget getSvgImage(String image,
    {double? width,
      double? height,
      Color? color,
      BoxFit boxFit = BoxFit.contain}) {
  return color==null ? SvgPicture.asset(
    ConstantData.assetsPath + image,
    width: width,
    height: height,
    fit: boxFit,
  ): SvgPicture.asset(
    ConstantData.assetsPath + image,
    width: width,
    colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
    height: height,
    fit: boxFit,
  );
}

class ConstantData {
  static String assetsPath = "assets/images/";
}