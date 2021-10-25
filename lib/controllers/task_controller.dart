import 'package:get/get.dart';
import 'package:todo_app/database/db_helper.dart';
import 'package:todo_app/models/task.dart';

class TaskController extends GetxController {
  Future<int> addTask(Task task) async {
    return await DBHelper.insert(task);
  }
}
