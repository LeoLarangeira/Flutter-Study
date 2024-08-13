import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_study/controllers/task_groups_controller.dart';

import '../../model/task_groups_model.dart';

part 'task_groups_page_controller.g.dart'; // Certifique-se de que esta linha está presente

class TaskGroupsPageController = _TaskGroupsPageController
    with _$TaskGroupsPageController;

abstract class _TaskGroupsPageController with Store {
  @observable
  bool loading = true;

  @observable
  GlobalKey<FormState> formKey = GlobalKey();

  @observable
  List<TaskGroup> taskGroups = <TaskGroup>[];

  @observable
  var txtTaskGroupName = TextEditingController();

  @action
  Future getData() async {
    taskGroups = await TaskGroupsController().index();

    loading = false;
  }

  @action
  void createTaskGroup(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => StatefulBuilder(
            builder: (context, setState) => AlertDialog(
                  title: const Text('Create a task group'),
                  content: Form(
                    child: TextFormField(
                      controller: txtTaskGroupName,
                      validator: (value) =>
                          value!.isEmpty ? 'Inform the task group name' : null,
                      decoration: const InputDecoration(
                        labelText: 'Task group name',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  actions: [
                    MaterialButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancel'),
                    ),
                    MaterialButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Create'))
                  ],
                )));
  }
}
