import 'package:flutter/widgets.dart';
import 'package:teste_out/src/core/ui/constants/constants.dart';

class TextStyles {
  static TextStyles? _instance;

  TextStyles._();

  static TextStyles get instance {
    _instance ??= TextStyles._();
    return _instance!;
  }

  String get fontFamily => 'Open Sans';

  TextStyle get textLight => TextStyle(
        fontWeight: FontWeight.w300,
        fontFamily: fontFamily,
      );

  TextStyle get textNormal => TextStyle(
        fontWeight: FontWeight.w300,
        fontFamily: fontFamily,
      );

  TextStyle get textRegular => TextStyle(
        fontWeight: FontWeight.w400,
        fontFamily: fontFamily,
      );

  TextStyle get textMedium => TextStyle(
        fontWeight: FontWeight.w500,
        fontFamily: fontFamily,
      );

  TextStyle get textSemiBold => TextStyle(
        fontWeight: FontWeight.w600,
        fontFamily: fontFamily,
      );

  TextStyle get textBold => TextStyle(
        fontWeight: FontWeight.bold,
        fontFamily: fontFamily,
      );

  TextStyle get textExtraBold => TextStyle(
        fontWeight: FontWeight.w800,
        fontFamily: fontFamily,
      );

  TextStyle get textButtonLabel1 => textSemiBold.copyWith(
        fontSize: 20,
        color: ColorsConstants.black,
      );
  TextStyle get textButtonLabel2 => textSemiBold.copyWith(
        fontSize: 14,
        color: ColorsConstants.black,
      );
  TextStyle get textTitle => textExtraBold.copyWith(
        fontSize: 22,
        color: ColorsConstants.black,
      );
  TextStyle get textSubtitle1 => textNormal.copyWith(
        fontSize: 16,
        color: ColorsConstants.black,
      );
  TextStyle get textSubtitle2 => textSemiBold.copyWith(
        fontSize: 16,
        color: ColorsConstants.black,
      );
  TextStyle get textSubtitle3 => textBold.copyWith(
        fontSize: 16,
        color: ColorsConstants.black,
      );
  TextStyle get textLabel1 => textExtraBold.copyWith(
        fontSize: 12,
        color: ColorsConstants.lightGrey,
      );
  TextStyle get textLabel2 => textExtraBold.copyWith(
        fontSize: 14,
        color: ColorsConstants.lightGrey,
      );
}

extension TextStyleExtensions on BuildContext {
  TextStyles get textStyles => TextStyles.instance;
}
