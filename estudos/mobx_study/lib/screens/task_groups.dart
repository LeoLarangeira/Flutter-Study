import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobx_study/controllers/task_groups_page_controllers/task_groups_page_controller.dart';
import 'package:mobx_study/screens/task_pages.dart';

//TODO -> CHECK VALIDATOR

class TaskGroupsPage extends StatefulWidget {
  const TaskGroupsPage({super.key});

  @override
  State<TaskGroupsPage> createState() => _TaskGroupsPageState();
}

class _TaskGroupsPageState extends State<TaskGroupsPage> {
  final taskGroupPageController = TaskGroupsPageController();

  @override
  void initState() {
    taskGroupPageController.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Task Group',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () => taskGroupPageController.createTaskGroup(context),
            icon: const Icon(Icons.add),
            color: Colors.white,
          )
        ],
      ),
      body: Observer(
        builder: (context) {
          print('Loading: ${taskGroupPageController.loading}');
          print('Task Groups: ${taskGroupPageController.taskGroups}');

          return !taskGroupPageController.loading
              ? taskGroupPageController.taskGroups.isEmpty
                  ? Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.7,
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            'assets/illustrations/undraw_completing_re_i7ap.svg',
                            height: 150,
                          ),
                          const Padding(padding: EdgeInsets.only(top: 42)),
                          ElevatedButton(
                              onPressed: () => taskGroupPageController
                                  .createTaskGroup(context),
                              child: const Text('Create My First Task Group'))
                        ],
                      ),
                    )
                  : Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      padding: const EdgeInsets.all(15),
                      child: ListView.builder(
                        primary: false,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Card(
                            elevation: 6,
                            margin: const EdgeInsets.all(10),
                            color: Colors.white,
                            child: ListTile(
                              title: Text(
                                taskGroupPageController.taskGroups[index].name!,
                                style: const TextStyle(
                                    color: Colors.deepPurpleAccent),
                              ),
                              onTap: () =>
                                  taskGroupPageController.deleteTaskGroup(
                                      taskGroupPageController
                                          .taskGroups[index].id!,
                                      context),
                              trailing: IconButton(
                                onPressed: () => {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => TaskPages(
                                              taskGroupPageController
                                                  .taskGroups[index].id!)))
                                },
                                icon: const Icon(Icons.keyboard_arrow_right),
                                color: Colors.deepPurpleAccent,
                              ),
                            ),
                          );
                        },
                        itemCount: taskGroupPageController.taskGroups.length,
                      ),
                    )
              : const Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}
