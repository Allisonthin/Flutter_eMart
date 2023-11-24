import 'package:e_mart/utils/theme/custom_theme/appBar_theme.dart';
import 'package:e_mart/utils/theme/custom_theme/bottom_sheet_theme.dart';
import 'package:e_mart/utils/theme/custom_theme/checkBox_theme.dart';
import 'package:e_mart/utils/theme/custom_theme/chip_theme.dart';
import 'package:e_mart/utils/theme/custom_theme/elevated_button_theme.dart';
import 'package:e_mart/utils/theme/custom_theme/outline_elevated_bottom_theme.dart';
import 'package:e_mart/utils/theme/custom_theme/textTheme.dart';
import 'package:e_mart/utils/theme/custom_theme/text_field_theme.dart';
import 'package:flutter/material.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    primaryColor: Colors.blue,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TTextTheme.lightTextTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButton,
    chipTheme: TChipTheme.lightChipTheme,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    checkboxTheme: TCheckBoxTheme.lightCheckboxTheme,
    bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme ,
    outlinedButtonTheme: TOutlineElevatedBottom.lightOutlineElevatedBottom,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecoration,

  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    primaryColor: Colors.blue,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    textTheme: TTextTheme.darkTextTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButton,
    chipTheme: TChipTheme.darkChipTheme,
    appBarTheme: TAppBarTheme.darkAppBarTheme,
    checkboxTheme: TCheckBoxTheme.darkCheckboxTheme,
    bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme ,
    outlinedButtonTheme: TOutlineElevatedBottom.darkOutlineElevatedBottom,
    inputDecorationTheme: TTextFormFieldTheme.darkInputDecoration,
  );
}
