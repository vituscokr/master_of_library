import 'package:flutter/material.dart';

extension TextStyleExtensions on TextStyle {
  TextStyle colored(Color color ) => copyWith(color: color);
}
