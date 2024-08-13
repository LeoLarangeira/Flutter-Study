import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobx_study/controllers/task_groups_page_controllers/task_groups_page_controller.dart';

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
      ),
      body: Observer(
        builder: (context) {
          print('Loading: ${taskGroupPageController.loading}');
          print('Task Groups: ${taskGroupPageController.taskGroups.isEmpty}');

          return !taskGroupPageController.loading
              ? taskGroupPageController.taskGroups.isEmpty
                  ? Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.7,
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              'assets/illustrations/undraw_to_do_re_jaef.svg',
                              height: 150,
                            ),
                            const Padding(padding: EdgeInsets.only(top: 42)),
                            ElevatedButton(
                                onPressed: () => taskGroupPageController
                                    .createTaskGroup(context),
                                child: const Text('Create My First Task Group'))
                          ],
                        ),
                      ),
                    )
                  : Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      alignment: Alignment.center,
                      child: const Column(
                        mainAxisSize: MainAxisSize.min,
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
