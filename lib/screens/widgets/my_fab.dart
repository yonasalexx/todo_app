import 'package:flutter/material.dart';
import 'package:todo_app/constants/constants.dart';

class MyFab extends StatelessWidget {
  const MyFab({
    Key? key,
    required this.onPressed,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: onPressed,
      backgroundColor: AppColor.yellow.withRed(290),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      label: Row(
        children: [
          Text(title, style: const TextStyle(color: AppColor.white)),
          const SizedBox(width: 5),
          Icon(icon, size: 16, color: AppColor.white),
        ],
      ),
    );
  }
}
