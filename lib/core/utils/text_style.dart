import 'package:bookia/core/utils/appcolour.dart';
import 'package:flutter/widgets.dart';

TextStyle getHeaderTextStyle({
  String? family,
  double? fontSize,
  FontWeight? fontWeight,
  Color? color,
}) {
  return TextStyle(
    fontFamily: family ?? 'DM Serif Display',
    fontSize: fontSize ?? 24,
    fontWeight: fontWeight ?? FontWeight.w400,
    color: color ?? AppColours.darkColor,
  );
}

TextStyle getBodyTextStyle({
  String? family,
  double? fontSize,
  FontWeight? fontWeight,
  Color? color,
}) {
  return TextStyle(
    fontFamily: family ?? 'DM Serif Display',
    fontSize: fontSize ?? 18,
    fontWeight: fontWeight ?? FontWeight.w400,
    color: color ?? AppColours.darkColor,
    
  );
}
