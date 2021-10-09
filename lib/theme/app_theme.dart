/*
 * @Description: app主题
 * @Author: iamsmiling
 * @Date: 2021-09-18 16:02:00
 * @LastEditTime: 2021-10-09 11:43:09
 */
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:ty_flutter_cli/res/R.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTheme {
  static ThemeData lightTheme = ThemeData(
      fontFamily: GoogleFonts.poppins().fontFamily,
      textTheme: TextTheme(
        bodyText1: TextStyle(color: R.color.bodyText),
        bodyText2: TextStyle(color: R.color.bodyText),
      ),
      dividerColor: R.color.divider,
      dividerTheme: DividerThemeData(color: R.color.divider, thickness: 1),
      progressIndicatorTheme:
          ProgressIndicatorThemeData(color: R.color.primary),
      primaryColor: R.color.primary,
      appBarTheme: AppBarTheme(
          centerTitle: true,
          elevation: .5,
          titleTextStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          )),
      buttonTheme: ButtonThemeData(
          highlightColor: R.color.hightlightButton,
          buttonColor: R.color.button),
      bottomNavigationBarTheme:
          BottomNavigationBarThemeData(selectedItemColor: R.color.primary),
      inputDecorationTheme: InputDecorationTheme(
          enabledBorder: InputBorder.none,
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintStyle: TextStyle(
              fontWeight: FontWeight.w600,
              color: R.color.bodyText,
              fontSize: 14,
              letterSpacing: 1.2,
              height: 26 / 14)
          // enabledBorder: UnderlineInputBorder(
          //     borderSide:
          //         BorderSide(color: R.color.textFieldBorder, width: .5)),
          // focusedBorder: UnderlineInputBorder(
          //     borderSide:
          //         BorderSide(color: R.color.textFieldBorder, width: .5)),
          // border: UnderlineInputBorder(
          //     borderSide:
          //         BorderSide(color: R.color.textFieldBorder, width: .5))
          ),
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
        splashFactory: NoSplash.splashFactory,
        // foregroundColor: MaterialStateProperty.all(R.color.textButton),
        textStyle: MaterialStateProperty.all(
            TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
      )),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              padding:
                  MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 5)),
              // foregroundColor: MaterialStateProperty.all(R.color.white),
              textStyle: MaterialStateProperty.all(
                  TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              backgroundColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.disabled)) {
                  return R.color.primary.withOpacity(.4);
                }
                return R.color.primary;
              }))));

  static ThemeData dartTheme = lightTheme;
}
