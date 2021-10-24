import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeServices {
  final GetStorage localStorage = GetStorage();
  final String themeKey = 'darkMode';

  bool _loadThemeFromLocalStorage() => localStorage.read(themeKey) ?? false;
  ThemeMode get savedTheme {
    return _loadThemeFromLocalStorage() ? ThemeMode.dark : ThemeMode.light;
  }

  void changeThemeMode() {
    Get.changeThemeMode(
      _loadThemeFromLocalStorage() ? ThemeMode.light : ThemeMode.dark,
    );
    saveThemeToLocalStorage(!_loadThemeFromLocalStorage());
  }

  saveThemeToLocalStorage(newTheme) => localStorage.write(themeKey, newTheme);
}
