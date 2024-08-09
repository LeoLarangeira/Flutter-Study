class Todo {
  final int id;
  final String title;
  final bool done;
  Todo({required this.id, required this.title, required this.done});

  factory Todo.fromSqfliteDatabase(Map<String, dynamic> map) => Todo(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      done: map['done'] == 0);
}
