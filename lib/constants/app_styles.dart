import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'constants.dart';

const datePickerTextStyle = TextStyle(
  fontSize: 11,
  fontWeight: FontWeight.w600,
  color: Colors.grey,
);

TextStyle hintTextStyle = TextStyle(
  fontSize: 13,
  fontWeight: FontWeight.w400,
  color: Get.isDarkMode ? AppColor.lightGrey.withOpacity(0.4) : AppColor.grey,
);
