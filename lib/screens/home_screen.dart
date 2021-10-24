import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/constants/app_color.dart';
import 'package:todo_app/constants/services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: const Center(
        child: Text('This is home screen\'s body.'),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: context.theme.backgroundColor,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 13),
          Text(
            'TODO',
            style: TextStyle(
              color: Get.isDarkMode ? AppColor.white : AppColor.darkGrey,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Oct 24, 2021',
            style: TextStyle(
              fontSize: 13,
              color: Get.isDarkMode ? AppColor.lightGrey : AppColor.grey,
              letterSpacing: 2,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      actions: _buildActions(),
    );
  }

  List<Widget> _buildActions() => [
        IconButton(
          onPressed: () => ThemeServices().changeThemeMode(),
          icon: Icon(
            Get.isDarkMode ? Icons.lightbulb_outline : Icons.lightbulb,
          ),
          iconSize: 20,
          color: Get.isDarkMode ? AppColor.yellow : AppColor.yellow,
        ),
        IconButton(
          onPressed: () {
            print('Settings button tapped!');
          },
          icon: const Icon(Icons.settings),
          color: Get.isDarkMode ? AppColor.white : AppColor.black,
        ),
      ];
}
