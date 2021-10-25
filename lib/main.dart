import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_app/constants/screens.dart';
import 'package:todo_app/constants/services.dart';
import 'package:todo_app/database/db_helper.dart';
import 'package:todo_app/utils/themes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await DBHelper.initDb();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo App',
      theme: Themes.lightMode,
      darkTheme: Themes.darkMode,
      themeMode: ThemeServices().savedTheme,
      home: const HomeScreen(),
    );
  }
}
