import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import 'todo_db.dart';

class DBProvider {
  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initialize();
    return _database!;
  }

  Future<String> get fullPath async {
    const name = 'todo.db';
    final path = await getDatabasesPath();
    return join(path, name);
  }

  Future<Database> _initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    final path = await fullPath;
    print('creating db');
    var database = await openDatabase(path,
        version: 1, onCreate: create, singleInstance: true);
    print('db created');
    return database;
  }

  Future<void> create(Database database, int version) async {
    sqfliteFfiInit();

    databaseFactory = databaseFactoryFfi;
    await TodoDB().createTable(database);
  }
}
