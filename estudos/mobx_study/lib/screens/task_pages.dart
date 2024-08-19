import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobx_study/controllers/task_page_controllers/task_page_controller.dart';

class TaskPages extends StatefulWidget {
  final int groupId;
  const TaskPages(this.groupId, {Key? key}) : super(key: key);

  @override
  State<TaskPages> createState() => _TaskPagesState();
}

class _TaskPagesState extends State<TaskPages> {
  late final TaskPageController taskPageController;

  @override
  void initState() {
    super.initState();
    taskPageController = TaskPageController();
    taskPageController.getData(widget.groupId);
    print('Initializing TaskPage with groupId: ${widget.groupId}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tasks',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () => taskPageController.createTask(context),
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Observer(
        builder: (_) {
          print('Loading State: ${taskPageController.loading}');
          print('Tasks Count: ${taskPageController.tasks.length}');
          print('Tasks name: ${taskPageController.tasks}');
          if (taskPageController.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (taskPageController.tasks.isEmpty) {
            return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.7,
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    'assets/illustrations/undraw_checklist__re_2w7v.svg',
                    height: 150,
                  ),
                  const Padding(padding: EdgeInsets.only(top: 42)),
                  ElevatedButton(
                    onPressed: () => taskPageController.createTask(context),
                    child: const Text('Create My First Task on this Group'),
                  )
                ],
              ),
            );
          } else {
            return Container(
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
                      onTap: () => taskPageController.deleteTask(
                          taskPageController.tasks[index].id!, context),
                      title: Text(
                        taskPageController.tasks[index].taskName!,
                        style: const TextStyle(color: Colors.deepPurpleAccent),
                      ),
                    ),
                  );
                },
                itemCount: taskPageController.tasks.length,
              ),
            );
          }
        },
      ),
    );
  }
}
