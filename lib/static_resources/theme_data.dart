import 'package:flutter/material.dart';

import 'color_resources.dart';

class UpbTextStyle {
  static TextStyle getTextStyle(textSize, textColor, fontFamily) {
    return TextStyle(
        color: textColor,
        fontSize: _getTextType(textSize),
        fontFamily: _getTextFontWeight(fontFamily));
  }

  static double _getTextType(textSize) {
    double size;
    switch (textSize) {
      case 'h1':
        size = 50.0;
        break;
      case 'h2':
        size = 40.0;
        break;
      case 'h3':
        size = 35.0;
        break;
      case 'h4':
        size = 15.0;
        break;
      case 'b1':
        size = 30.0;
        break;
      case 'b2':
        size = 20.0;
        break;
      case 'b3':
        size = 10.0;
        break;
      default:
        size = 15.0;
    }
    return size;
  }

  static String _getTextFontWeight(fontFamily) {
    String fontFamilySelected;
    switch (fontFamily) {
      case 'n':
        fontFamilySelected = 'Montserrat-Black';
        break;
      case 'i':
        fontFamilySelected = 'Montserrat-BlackItalic';
        break;
      case 'b':
        fontFamilySelected = 'Montserrat-Bold';
        break;
      case 'l':
        fontFamilySelected = 'Montserrat-ExtraLight';
        break;
      case 'eli':
        fontFamilySelected = 'Montserrat-ExtraLightItalic';
        break;
      default:
        fontFamilySelected = 'Montserrat-ExtraLight';
    }
    return fontFamilySelected;
  }




}
