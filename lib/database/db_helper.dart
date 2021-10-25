import 'package:sqflite/sqflite.dart';
import 'package:todo_app/models/task.dart';

class DBHelper {
  static Database? _db;
  static const int _version = 1;
  static const String _tableName = 'task';

  static Future<void> initDb() async {
    if (_db != null) {
      return;
    }
    String _path = await getDatabasesPath() + 'tasks.db';
    _db = await openDatabase(
      _path,
      version: _version,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE $_tableName('
          'id INTEGER PRIMARY KEY AUTOINCREMENT, '
          'title STRING, note TEXT, date STRING, '
          'startTime STRING, endTime STRING, '
          'reminder INTEGER, repeat STRING, '
          'color INTEGER, '
          'isCompleted INTEGER)',
        );
      },
    );
  }

  static Future<int> insert(Task task) async {
    return await _db!.insert(_tableName, task.toJson());
  }
}
