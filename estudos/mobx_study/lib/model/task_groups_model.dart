class TaskGroup {
  late final int? id;
  late final String? name;

  TaskGroup({this.id, this.name});

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name};
  }

  @override
  String toString() {
    return 'TaskGroup{ id : $id, name : $name}';
  }
}
