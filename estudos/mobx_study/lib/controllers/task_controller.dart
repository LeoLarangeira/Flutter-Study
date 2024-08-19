import 'dart:async';

import 'package:mobx_study/db/database_config.dart';
import 'package:mobx_study/model/task_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class TaskController {
  DatabaseConfig databaseConfig = DatabaseConfig();
  String dbName = 'tasks';

  Future<List<Task>> index() async {
    Database db = await databaseConfig.getDatabase();

    List<Map<String, dynamic>> maps = await db.query(dbName, orderBy: 'id ASC');
    return List.generate(maps.length, (index) {
      return Task(
          id: maps[index]['id'],
          taskName: maps[index]['task_name'],
          completed: maps[index]['completed'] == 0,
          groupId: maps[index]['groupId']);
    });
  }

  Future<List<Task>> getById(int groupId) async {
    Database db = await databaseConfig.getDatabase();
    List<Map<String, dynamic>> maps = await db.query(dbName,
        where: 'group_id = ?', whereArgs: [groupId], orderBy: 'id ASC');
    return List.generate(maps.length, (index) {
      return Task(
          id: maps[index]['id'],
          taskName: maps[index]['task_name'],
          completed: maps[index]['completed'] == 0,
          groupId: maps[index]['group_id']);
    });
  }

  Future<bool> store(Task task) async {
    Database db = await databaseConfig.getDatabase();
    bool success = false;
    try {
      await db.insert(dbName, task.toMap());
      success = true;
    } catch (err) {
      return success;
    }
    return success;
  }

  // delete by id
  Future delete(int taskId) async {
    Database db = await databaseConfig.getDatabase();
    bool success = false;
    try {
      await db.delete(dbName, where: 'id = ?', whereArgs: [taskId]);
      success = true;
    } catch (e) {
      return e;
    }

    return success;
  }
}
