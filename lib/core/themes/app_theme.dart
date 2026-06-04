import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ieee/core/constant/app_color.dart';

class AppTheme {
  AppTheme._();

  static final light = ThemeData(
    scaffoldBackgroundColor: AppColor.white,
    appBarTheme: AppBarTheme(backgroundColor: AppColor.white),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: AppColor.red,
        fontSize: 24,
        fontFamily: "Inter",
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        color: AppColor.black,
        fontSize: 24,
        fontWeight: FontWeight.normal,
      ),
      titleSmall: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.normal,
        color: AppColor.grey,
      ),
      bodyLarge: TextStyle(
        color: AppColor.black,
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
    ),
    iconTheme: IconThemeData(color: AppColor.red),
    brightness: Brightness.dark,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColor.babygrey,
      selectionColor:
          AppColor.babyred, // Sets the text selection background color
      selectionHandleColor: AppColor.grey,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color.fromARGB(255, 252, 253, 255),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: AppColor.babyred),
      ),
      outlineBorder: BorderSide(color: AppColor.babyred),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: AppColor.red),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: AppColor.babyred),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(1.w),
        borderSide: BorderSide(color: AppColor.babyred),
      ),
      labelStyle: TextStyle(color: AppColor.grey, fontSize: 18),
      hintStyle: TextStyle(
        color: AppColor.babygrey,
        fontSize: 16,
        fontWeight: FontWeight.normal,
      ),
    ),
  );
  static final dark = ThemeData(
    scaffoldBackgroundColor: AppColor.black,
    appBarTheme: AppBarTheme(backgroundColor: AppColor.black),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: AppColor.red,
        fontSize: 20,
        fontFamily: "Inter",
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        color: AppColor.white,
        fontSize: 24,
        fontWeight: FontWeight.normal,
      ),
      titleSmall: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.normal,
        color: AppColor.grey,
      ),
      bodyLarge: TextStyle(
        color: AppColor.white,
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
    ),
    brightness: Brightness.dark,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: Colors.white, // Sets the global cursor color
      selectionColor:
          AppColor.babyred, // Sets the text selection background color
      selectionHandleColor: AppColor.grey,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColor.grey,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: AppColor.babyred),
      ),
      outlineBorder: BorderSide(color: AppColor.babyred),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: AppColor.red),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: AppColor.babyred),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(1.w),
        borderSide: BorderSide(color: AppColor.babyred),
      ),
      labelStyle: TextStyle(color: AppColor.grey, fontSize: 16),
      hintStyle: TextStyle(color: AppColor.grey, fontSize: 16),
    ),
  );
}
