import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx_study/db/db.dart';
import 'package:mobx_study/screens/list_screen.dart';
import 'package:mobx_study/stores/list_store.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  databaseFactory = databaseFactoryFfi;

  // Registre a instância de ListStore com GetIt
  GetIt.I.registerSingleton<ListStore>(ListStore());

  // Execute o aplicativo
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.deepPurpleAccent,
        scaffoldBackgroundColor: Colors.deepPurpleAccent,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ListScreen(),
    );
  }
}
