class Task {
  late final int id;
  late final String taskName;
  late final bool completed;
  late final int groupId;
  Task(this.id, this.taskName, this.completed, this.groupId);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'taskName': taskName,
      'completed': completed,
      'groupId': groupId
    };
  }

  @override
  String toString() {
    return '''
    Task{
      id: $id,
      taskName: $taskName,
      completed: $completed,
      groupId: $groupId
    }''';
  }
}
