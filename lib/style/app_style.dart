import 'package:ai_chat_flutter/helpers/extension/responsive.dart';
import 'package:flutter/material.dart';

class Style {
  Style();

  //Main
  static const Color primaryColor = Color(0xff17CE92);
  static const Color secondaryColor = Color(0xff335081);
  static const Color success = Color(0xff12D18E);
  static const Color infoColor = Color(0xff17CE92);
  static const Color warning = Color(0xffFACC15);
  static const Color error = Color(0xffF75555);
  static const Color lightDis = Color(0xffD8D8D8);
  static const Color darkDis = Color(0xff636363);
  static const Color disButton = Color(0xff12A575);

  //Greyscale
  static const Color greyscale900 = Color(0xff212121);
  static const Color greyscale800 = Color(0xff424242);
  static const Color greyscale700 = Color(0xff616161);
  static const Color greyscale600 = Color(0xff757575);
  static const Color greyscale500 = Color(0xff9e9e9e);
  static const Color greyscale400 = Color(0xffbdbdbd);
  static const Color greyscale300 = Color(0xFFE0E0E0);
  static const Color greyscale200 = Color(0xFFEEEEEE);
  static const Color greyscale100 = Color(0xFFF5F5F5);
  static const Color greyscale50 = Color(0xFFF9F9F9);

  //Gradient
  LinearGradient gradientGreen = const LinearGradient(
    begin: Alignment(-0.96, 0.28),
    end: Alignment(0.96, -0.28),
    colors: [Color(0xFF17CE92), Color(0xFF2BE9AB)],
  );

  LinearGradient gradientMain = const LinearGradient(
    begin: Alignment(-0.96, 0.28),
    end: Alignment(0.96, -0.28),
    colors: [Color(0xFF4B68FF), Color(0xFF6A82FF)],
  );

  //Background
  static const Color greenBackground = Color(0xFFEDFBF7);
  static const Color blueBackground = Color(0xffF2F4FF);
  static const Color tealBackground = Color(0xffEFF9F8);
  static const Color brownBackground = Color(0xFFFAF5F3);
  static const Color redBackground = Color(0xFFEDFBF7);
  static const Color yellowBackground = Color(0xFFFFFCEB);
  static const Color orangeBackground = Color(0xFFFFF8EE);
  static const Color purpleBackground = Color(0xFFF9F8FF);

  //Text style
  static const String fontMedium = "Urbanist-Medium";
  static const String fontSemiBold = "Urbanist-SemiBold";
  static const String fontRegular = "Urbanist-Regular";
  static const String fontBold = "Urbanist-Bold";

  TextStyle textStyle({
    double? height,
    double? letterSpacing,
    double? fontSize,
    String? fontFamily,
    Color? color,
  }) =>
      TextStyle(
        color: color ?? greyscale900,
        fontFamily: fontFamily ?? fontSemiBold,
        fontSize: fontSize ?? 14.sp,
      );

//Heading1
  TextStyle headline5Neutrals1 = TextStyle(
    color: greyscale900,
    fontFamily: fontRegular,
    fontSize: 12.sp,
    letterSpacing: -0.01,
  );

  TextStyle h1Bold = TextStyle(
    color: greyscale900,
    fontFamily: fontBold,
    fontSize: 48.sp,
  );

  TextStyle h1SemiBold = TextStyle(
    color: greyscale900,
    fontFamily: fontSemiBold,
    fontSize: 48.sp,
  );

  TextStyle h1Medium = TextStyle(
    color: greyscale900,
    fontFamily: fontMedium,
    fontSize: 48.sp,
  );

  TextStyle h1Regular = TextStyle(
    color: greyscale900,
    fontFamily: fontRegular,
    fontSize: 48.sp,
  );

  //Body
  TextStyle bodySmallBold = TextStyle(
    color: greyscale900,
    fontFamily: fontBold,
    fontSize: 12.sp,
  );

  TextStyle bodySmallSEMIBold = TextStyle(
    color: greyscale900,
    fontFamily: fontSemiBold,
    fontSize: 12.sp,
  );

  TextStyle bodySmallMedium = TextStyle(
    color: greyscale900,
    fontFamily: fontMedium,
    fontSize: 12.sp,
  );

  TextStyle bodySmallRegular = TextStyle(
    color: greyscale900,
    fontFamily: fontRegular,
    fontSize: 12.sp,
  );

  //BodyXSmall
  TextStyle bodyXSmallBold = TextStyle(
    color: greyscale900,
    fontFamily: fontBold,
    fontSize: 10.sp,
  );

  TextStyle bodyXSmallSEMIBold = TextStyle(
    color: greyscale900,
    fontFamily: fontSemiBold,
    fontSize: 10.sp,
  );

  TextStyle bodyXSmallMedium = TextStyle(
    color: greyscale900,
    fontFamily: fontMedium,
    fontSize: 10.sp,
  );

  TextStyle bodyXSmallRegular = TextStyle(
    color: greyscale900,
    fontFamily: fontRegular,
    fontSize: 10.sp,
  );
}
