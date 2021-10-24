import 'package:flutter/material.dart';
import 'package:todo_app/constants/app_color.dart';

class Themes {
  static final ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColor.white,
    backgroundColor: AppColor.white,
  );
  static final ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColor.darkGrey,
    backgroundColor: AppColor.darkGrey,
    canvasColor: AppColor.darkGrey,
  );
}
