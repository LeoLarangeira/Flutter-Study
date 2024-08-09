import 'package:sqflite/sqflite.dart';
import 'package:sqlite_app/db/db.dart'; // Certifique-se de que DBProvider está configurado corretamente
import 'package:sqlite_app/model/todo.dart';

class TodoDB {
  final tableName = 'todos';

  Future<void> createTable(Database database) async {
    await database.execute("""
    CREATE TABLE IF NOT EXISTS $tableName (
      "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
      "title" TEXT NOT NULL,
      "done" BOOLEAN DEFAULT FALSE
    )
    """);
  }

  Future<int> create({required String title}) async {
    final database = await DBProvider().database;
    return await database.rawInsert(
      '''INSERT INTO $tableName (title) VALUES (?)''',
      [title],
    );
  }

  Future<List<Todo>> fetchAll() async {
    final database = await DBProvider().database;
    final todos = await database.rawQuery('''SELECT * FROM $tableName''');
    return todos.map((todo) => Todo.fromSqfliteDatabase(todo)).toList();
  }

  Future<Todo> fetchById(int id) async {
    final database = await DBProvider().database;
    final todoList = await database
        .rawQuery('''SELECT * FROM $tableName WHERE id = ?''', [id]);
    if (todoList.isEmpty) {
      throw Exception('Todo not found');
    }
    return Todo.fromSqfliteDatabase(todoList.first);
  }

  Future<int> update({required int id, String? title}) async {
    final database = await DBProvider().database;
    return await database.update(
      tableName,
      {if (title != null) 'title': title},
      where: 'id = ?',
      whereArgs: [id],
      conflictAlgorithm: ConflictAlgorithm.rollback,
    );
  }

  Future<void> delete(int id) async {
    final database = await DBProvider().database;
    await database.rawDelete('''DELETE FROM $tableName WHERE id = ?''', [id]);
  }
}
