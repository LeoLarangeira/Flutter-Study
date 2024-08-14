import 'package:flutter/material.dart';

class TasksPage extends StatefulWidget {
  final int groupId;
  const TasksPage(this.groupId, {Key? key}) : super(key: key);

  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TasksPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: const Text('Text'),
      centerTitle: true,
    ));
  }
}
