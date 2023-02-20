import 'package:flutter/material.dart';
import 'package:online_learning_app/core/constants/color.dart';

TextStyle textStyle(
    {double? fontSize,
    Color? color,
    FontWeight? fontWeight,
    double? letterSpacing,
    double? height}) {
  return TextStyle(
      fontSize: fontSize,
      color: color,
      fontFamily: 'Raleway',
      fontWeight: fontWeight,
      height: height,
      letterSpacing: letterSpacing);
}
