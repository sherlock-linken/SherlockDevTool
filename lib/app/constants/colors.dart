import 'package:flutter/material.dart';

class AppColor {
  AppColor._();

  static const Color lightScaffoldBackgroundColor = Color(0xFFF9F9F9);
  static const Color darkScaffoldBackgroundColor = Color(0xFF2F2E2E);
  static const Color secondaryAppColor = Color(0xFF22DDA6);
  static const Color secondaryDarkAppColor = Colors.white;
  static const Color tipColor = Color(0xFFB6B6B6);
  static const Color lightGray = Color(0xFFF6F6F6);
  static const Color darkGray = Color(0xFF9F9F9F);
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color test1 = Color(0x33FF0000);
  static const Color test2 = Color(0x3300FF00);
  static const Color test3 = Color(0x330000FF);

  static const Color tabColor = Color(0xFF314055);
  static const Color tabBg = Color(0x33ecf0f5);

  // 主色调
  static const Color mainC = Color(0xFF1AC2FF);
  static const Color mainC40 = Color(0x661AC2FF);
  static const Color mainC20 = Color(0x331AC2FF);
  static const Color mainC10 = Color(0x1A1AC2FF);
  static const Color appColor = Color(0xFF1AC2FF);

  // 应用色
  static const Color appPink = Color(0xFFFF6697);
  static const Color appBlue = Color(0xFF4C8DFF);
  static const Color appYellow = Color(0xFFFFCB51);

  // 功能色
  static const Color funRed = Color(0xFFFF6365);
  static const Color funOrange = Color(0xFFFFA033);
  static const Color funBlue = Color(0xFF3E8BFF);
  static const Color funBlueMain = Color(0xFF1AC2FF);
  static const Color funGreen = Color(0xFF19DECA);

  // 中性色
  static const Color mid1 = Color(0xFF1E1F21);
  static const Color mid2 = Color(0xFF727883);
  static const Color mid3 = Color(0xFF9AA3B3);
  static const Color mid4 = Color(0xFFDCDFE7);
  static const Color mid5 = Color(0x14FFFFFF);
  static const Color mid5_40 = Color(0x08FFFFFF);
  static const Color mid6 = Color(0xFFF3F5FA);

  // 深色文本
  static const Color dText1 = Color(0xFF1E1F21);
  static const Color dText2 = Color(0xFF727883);
  static const Color dText3 = Color(0xFF9AA3B3);
  static const Color dText4 = Color(0xFFC4CAD5);

  // 浅色文本
  static const Color lText1 = Color(0xFFFFFFFF);
  static const Color lText2 = Color(0xB3FFFFFF);
  static const Color lText3 = Color(0x59FFFFFF);
  static const Color lText4 = Color(0x33FFFFFF);
}

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex), 'hex color must be #rrggbb or #rrggbbaa');

  return Color(int.parse(hex.substring(1), radix: 16) + (hex.length == 7 ? 0xff000000 : 0x00000000));
}
