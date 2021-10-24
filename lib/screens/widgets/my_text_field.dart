import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/constants/constants.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    Key? key,
    required this.title,
    required this.hintText,
    this.child,
    this.controller,
  }) : super(key: key);

  final String title;
  final String hintText;
  final Widget? child;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Get.isDarkMode ? Colors.white : Colors.black87,
          ),
        ),
        const SizedBox(height: 6),
        SizedBox(
          height: 45,
          child: TextField(
            readOnly: child == null ? false : true,
            controller: controller,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Get.isDarkMode ? AppColor.lightGrey : AppColor.darkGrey,
            ),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: hintTextStyle,
              contentPadding: const EdgeInsets.all(10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: AppColor.grey,
                ),
              ),
              suffixIcon: child ?? const SizedBox(),
            ),
          ),
        ),
      ],
    );
  }
}
