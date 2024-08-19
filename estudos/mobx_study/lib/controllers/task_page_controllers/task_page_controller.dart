import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_study/controllers/task_controller.dart';
import 'package:mobx_study/model/task_model.dart';

part 'task_page_controller.g.dart';

class TaskPageController = _TaskPageController with _$TaskPageController;

abstract class _TaskPageController with Store {
  late int groupId;
  @observable
  bool loading = false;

  @observable
  List<Task> tasks = <Task>[];

  @observable
  GlobalKey<FormState> formKey = GlobalKey();

  @observable
  var txtTaskName = TextEditingController();

  @action
  Future getData(int groupId) async {
    loading = true;
    this.groupId = groupId;
    tasks = await TaskController().getById(groupId);
    loading = false;
  }

  @action
  void createTask(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => StatefulBuilder(
            builder: (context, setState) => AlertDialog(
                  title: const Text('Create a task'),
                  content: Form(
                    key: formKey,
                    child: TextFormField(
                      controller: txtTaskName,
                      validator: (value) =>
                          value!.isEmpty ? 'Inform the task name' : null,
                      decoration: const InputDecoration(
                          labelText: 'Task name', border: OutlineInputBorder()),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  actions: [
                    MaterialButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancel'),
                    ),
                    MaterialButton(
                      onPressed: () => validateFormAndCreateTask(context),
                      child: const Text('Create'),
                    )
                  ],
                )));
  }

  @action
  Future validateFormAndCreateTask(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      await TaskController().store(
          Task(taskName: txtTaskName.text, completed: false, groupId: groupId));
      Navigator.pop(context);
      getData(groupId);
    }
  }

  @action
  void deleteTask(int taskId, BuildContext context) async {
    showDialog(
        context: context,
        builder: (_) => StatefulBuilder(
            builder: (context, setState) => AlertDialog(
                  title: const Text('Do you really want to delete this Task?'),
                  actions: [
                    MaterialButton(
                        onPressed: () async {
                          bool success = await TaskController().delete(taskId);
                          if (success) {
                            await getData(groupId);
                            Navigator.pop(context);
                          }
                        },
                        child: const Text('Delete')),
                    MaterialButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Cancel'))
                  ],
                )));
  }
}
