import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DatabaseConfig {
  //open database, and create database file
  Future<Database> getDatabase() async {
    //sqfliteFfiInit();
    return openDatabase(
      join(await getDatabasesPath(), 'to_do_database_app.db'),
      onCreate: (db, version) async {
        await createTable(db);
      },
      onOpen: (db) {},
      onUpgrade: (db, oldVersion, newVersion) {},
      onDowngrade: (db, oldVersion, newVersion) {},
      version: 1,
    );
  }

  // create table task if not exists
  Future createTable(Database db) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS tasks(
      id INTEGER NOT NULL PRIMARY KEY,
      task_name TEXT NOT NULL, 
      completed INTEGER DEFAULT 0 CHECK (completed IN (0, 1)),
      group_id INTEGER
      )
      ''');
    await db.execute(
        'CREATE TABLE IF NOT EXISTS task_groups(id INTEGER PRIMARY KEY, name TEXT NOT NULL)');
    //await db.execute('DELETE FROM tasks');
    //await db.execute('DELETE FROM task_groups');
  }
}
