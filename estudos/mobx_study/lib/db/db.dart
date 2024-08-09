import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobx_study/domain/entities/todo_entity.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DB {
  Future<Database> _getDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), 'todo.db'),
      onCreate: (db, version) async {
        await db.execute(_todo);

        await db
            .rawInsert('INSERT INTO todo (name) VALUES ("Teste Raw Insert")');
      },
      version: 1,
    );
  }

  Future<void> create(TodoEntity todo) async {
    try {
      final Database db = await _getDatabase();

      final id = await db.insert(
        'todo',
        {'name': todo.name},
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      todo.id = id;
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  String get _todo => '''
    CREATE TABLE todo (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL,
      done INTEGER DEFAULT 0
    );
  ''';
}
