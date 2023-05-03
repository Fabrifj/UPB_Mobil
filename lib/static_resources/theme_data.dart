import 'package:flutter/material.dart';

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
      case 'mh1':
        size = 140.0;
        break;
      case 'h1':
        size = 48.0;
        break;
      case 'h2':
        size = 36.0;
        break;
      case 'h3':
        size = 24.0;
        break;
      case 'b1':
        size = 18.0;
        break;
      case 'b2':
        size = 16.0;
        break;
      case 'b3':
        size = 14.0;
        break;
      case 'd1':
        size = 14.0;
        break;
      case 'd2':
        size = 12.0;
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