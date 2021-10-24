import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/constants/constants.dart';

import 'widgets/my_text_field.dart';

enum Time { start, end }

class AddTaskScreen extends StatefulWidget {
  AddTaskScreen({Key? key, required this.selectedDate}) : super(key: key);
  DateTime selectedDate;
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  String startingTime = DateFormat('hh:mm a').format(DateTime.now()).toString();
  String endingTime = '0:00 PM';

  List<int> reminderList = [5, 10, 15, 20, 30];
  int selectedMinute = 5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
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
              const SizedBox(height: 14),
              Row(
                children: [
                  Expanded(
                    child: MyTextField(
                      title: 'STARTING TIME',
                      hintText: startingTime,
                      child: IconButton(
                        onPressed: () => _buildTimePicker(Time.start),
                        icon: const Icon(
                          Icons.access_time_rounded,
                          color: AppColor.grey,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: MyTextField(
                      title: 'ENDING TIME',
                      hintText: endingTime,
                      child: IconButton(
                        onPressed: () => _buildTimePicker(Time.end),
                        icon: const Icon(
                          Icons.access_time_rounded,
                          color: AppColor.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              MyTextField(
                title: 'REMINDER',
                hintText: '$selectedMinute MINUTES EARLY',
                child: DropdownButton(
                  items: reminderList
                      .map((e) => DropdownMenuItem(
                            child: Text(e.toString()),
                            value: e.toString(),
                          ))
                      .toList(),
                  icon: const Icon(
                    Icons.alarm,
                    color: Colors.grey,
                  ),
                  underline: const SizedBox(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedMinute = int.parse(newValue!);
                    });
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
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

  void _buildTimePicker(time) async {
    var pickedTime = await timePicker();
    String formatTime = pickedTime.format(context);
    if (time == Time.start) {
      setState(() {
        startingTime = formatTime;
      });
    }
    if (time == Time.end) {
      setState(() {
        endingTime = formatTime;
      });
    }
  }

  timePicker() {
    return showTimePicker(
      context: context,
      initialTime: TimeOfDay(
        hour: int.parse(startingTime.split(':')[0]),
        minute: int.parse(startingTime.split(':')[1].split(' ')[0]),
      ),
      initialEntryMode: TimePickerEntryMode.input,
    );
  }
}
