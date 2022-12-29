import 'package:flutter/material.dart';

enum AppFont {
  display3(
    'display3',
    'display3',
    32,
    42
  ),
  display2(
      'display2',
      'display2',
    28,
    38,
  ),
  display1(
      'display1',
      'display1',
    24,
    34,
  ),
  headline(
      'headline',
      'headline',
    20,
    28,
  ),
  title(
      'title',
      'title',
    18,
    28,
  ),
  large(
      'large',
      'large',
    16,
    24,
  ),
  small(
      'small',
      'small',
    14,
    20,
  ),
  caption(
      'caption',
      'caption',
      12,
    18,
  ),
  menu(
      'menu',
      'menu',
      10,
    14,
  ),
  undefined('default','', 0,0 );
  const AppFont(
      this.code,
      this.name,
      this.size,
      this.height
      );
  final String code;
  final String name;
  final double size;
  final double height;

  factory AppFont.getByCode(String code) {
    return AppFont.values.firstWhere((element) => element.code == code ,
    orElse: () => AppFont.undefined);
  }
}

extension AppFontExtension on AppFont {
  TextStyle get bold {
    final font = AppFont.values[index];
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: font.size,
      height:  font.height / font.size,
      letterSpacing: -0.6,
    );
  }
  TextStyle get regular {
    final font = AppFont.values[index];
    return TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: font.size,
      height:  font.height / font.size,
      letterSpacing: -0.6,
    );
  }
}


