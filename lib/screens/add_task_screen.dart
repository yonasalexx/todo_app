import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/constants/constants.dart';

import 'widgets/my_text_field.dart';

class AddTaskScreen extends StatefulWidget {
  AddTaskScreen({Key? key, required this.selectedDate}) : super(key: key);
  DateTime selectedDate;
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
            children: [
              const MyTextField(
                title: 'TITLE',
                hintText: 'Title goes here',
              ),
              const SizedBox(height: 8),
              const MyTextField(
                title: 'NOTE',
                hintText: 'Note goes here',
              ),
              const SizedBox(height: 8),
              MyTextField(
                title: 'DATE',
                hintText: DateFormat.yMd().format(widget.selectedDate),
                child: InkWell(
                  onTap: () {
                    _buildDatePicker();
                  },
                  child: const Icon(
                    Icons.calendar_today_outlined,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _buildDatePicker() async {
    DateTime? _datePicker = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime(2023),
    );
    if (_datePicker != null) {
      setState(() {
        widget.selectedDate = _datePicker;
      });
    }
  }
}
