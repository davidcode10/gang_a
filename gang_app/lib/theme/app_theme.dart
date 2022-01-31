import 'package:flutter/material.dart';
import 'package:gang_app/theme/color_theme.dart';
import 'package:gang_app/theme/text_theme.dart';

final ThemeData appTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: textTheme,
    primaryTextTheme: textTheme,
    scaffoldBackgroundColor: Colors.white,
    errorColor: AppColors.redError,
    colorScheme: lightColorScheme,
    primarySwatch: AppColors.secondary,
    backgroundColor: AppColors.white,
    inputDecorationTheme: inputTheme);

const InputDecorationTheme inputTheme =
    InputDecorationTheme(border: OutlineInputBorder());