import 'package:flutter/material.dart';
import 'package:sqlite_app/model/todo.dart';
import 'package:sqlite_app/db/todo_db.dart';
import 'package:sqlite_app/widget/todo_widget.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  Future<List<Todo>>? futureTodo;
  final todoDB = TodoDB();

  @override
  void initState() {
    super.initState();
    sqfliteFfiInit();

    databaseFactory = databaseFactoryFfi;
    fetchTodos();
  }

  void fetchTodos() {
    setState(() {
      futureTodo = todoDB.fetchAll();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ToDo SQLite App Study')),
      body: FutureBuilder<List<Todo>>(
        future: futureTodo,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text(
                'No tasks to do',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            );
          } else {
            final todos = snapshot.data!;
            return ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final todo = todos[index];
                return ListTile(
                  title: Text(
                    todo.title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  trailing: IconButton(
                    onPressed: () async {
                      await todoDB.delete(todo.id);
                      if (!mounted) return;
                      fetchTodos();
                    },
                    icon: const Icon(Icons.delete),
                    color: Colors.red,
                  ),
                  onTap: () async {
                    showDialog(
                      context: context,
                      builder: (context) => CreateTodoWidget(
                        todo: todo,
                        onSubmit: (title) async {
                          await todoDB.update(id: todo.id, title: title);
                          if (!mounted) return;
                          fetchTodos();
                          Navigator.of(context).pop();
                        },
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => CreateTodoWidget(
              onSubmit: (title) async {
                await todoDB.create(title: title);
                if (!mounted) return;
                fetchTodos();
                Navigator.of(context).pop();
              },
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
