import 'package:flutter/material.dart';

class Styles{

  static final Color colorPrimary = _hexToColor('4CAF50');
  static final Color colorPrimaryDark = _hexToColor('388E3C');
  static final Color colorPrimaryLight = _hexToColor('C8E6C9');
  static final Color colorAccent = _hexToColor('795548');
  static final Color colorPrimaryText = _hexToColor('212121');
  static final Color colorSecondaryText = _hexToColor('757575');
  static final Color colorDivider = _hexToColor('BDBDBD');


  static Color _hexToColor(String code) {
    return Color(int.parse(code.substring(0, 6), radix: 16) + 0xFF000000);
  }

}