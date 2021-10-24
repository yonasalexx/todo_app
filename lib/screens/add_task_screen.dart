import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/constants/constants.dart';

import 'widgets/my_text_field.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key, required this.selectedDate}) : super(key: key);
  final DateTime selectedDate;
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.theme.backgroundColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Get.isDarkMode ? AppColor.white : AppColor.black,
          ),
        ),
        title: Text(
          'Task Details',
          style: TextStyle(
            color: Get.isDarkMode ? AppColor.white : AppColor.darkGrey,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Column(
            children: const [
              MyTextField(
                title: 'TITLE',
                hintText: 'Title goes here',
              ),
              SizedBox(height: 8),
              MyTextField(
                title: 'NOTE',
                hintText: 'Note goes here',
              ),
              SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
