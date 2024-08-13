import 'package:mobx_study/db/database_config.dart';
import 'package:mobx_study/model/task_groups_model.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class TaskGroupsController {
  DatabaseConfig databaseConfig = DatabaseConfig();

  //Get all task groups from database.
  Future<List<TaskGroup>> index() async {
    Database db = await databaseConfig.getDatabase();
    List<Map<String, dynamic>> maps =
        await db.query('task_groups', orderBy: 'id ASC');
    return List.generate(maps.length, (index) {
      return TaskGroup(maps[index]['id'], maps[index]['name']);
    });
  }

  // Insert Task group in database (task_groups table)
  Future<bool> store(TaskGroup taskGroup) async {
    Database db = await databaseConfig.getDatabase();
    bool success = false;

    try {
      await db.insert('task_groups', taskGroup.toMap());
      success = true;
    } catch (err) {
      return success;
    }

    return success;
  }

  //Delete Task group in database

  Future delete(int taskGroupId) async {
    Database db = await databaseConfig.getDatabase();
    bool success = false;

    try {
      await db.delete('task_groups', where: 'id = ?', whereArgs: [taskGroupId]);
      success = true;
    } catch (err) {
      return success;
    }
    return success;
  }
}
