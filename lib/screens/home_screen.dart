import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/constants/constants.dart';
import 'package:todo_app/constants/screens.dart';
import 'package:todo_app/constants/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime _selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Row(
            children: [
              _buildViewAllTaskButton(),
              _buildDatePicker(),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.to(() => AddTaskScreen(selectedDate: _selectedDate));
        },
        backgroundColor: AppColor.yellow.withRed(290),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        label: Row(
          children: const [
            Text('CREATE', style: TextStyle(color: AppColor.white)),
            SizedBox(width: 5),
            Icon(Icons.mode_edit, size: 16, color: AppColor.white),
          ],
        ),
      ),
    );
  }

  Expanded _buildDatePicker() {
    return Expanded(
      child: DatePicker(
        DateTime.now(),
        height: 80,
        width: 50,
        selectionColor: AppColor.blue,
        initialSelectedDate: DateTime.now(),
        monthTextStyle: datePickerTextStyle,
        dateTextStyle: datePickerTextStyle.copyWith(fontSize: 18),
        dayTextStyle: datePickerTextStyle,
        onDateChange: (date) => setState(() => _selectedDate = date),
      ),
    );
  }

  GestureDetector _buildViewAllTaskButton() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 75,
        width: 50,
        margin: const EdgeInsets.only(left: 17),
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: AppColor.yellow.withRed(290),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'View',
              style: datePickerTextStyle.copyWith(color: AppColor.white),
            ),
            Text(
              'All',
              style: datePickerTextStyle.copyWith(
                fontSize: 18,
                color: AppColor.white,
              ),
            ),
            Text(
              'Tasks',
              style: datePickerTextStyle.copyWith(color: AppColor.white),
            ),
          ],
        ),
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
            DateFormat.yMMMMd().format(DateTime.now()),
            style: const TextStyle(
              fontSize: 13,
              color: AppColor.grey,
              letterSpacing: 2,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      actions: _buildActions(),
    );
  }

  List<Widget> _buildActions() {
    return [
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
}
