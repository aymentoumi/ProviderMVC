import 'package:project_board/controller/lane_controller.dart';
import 'package:project_board/main.dart';
import 'package:project_board/model/task.dart';
import 'package:project_board/model/task_state.dart';
import 'package:flutter/material.dart';
import 'package:project_board/util/task_util.dart';
import 'package:project_board/view/task_view.dart';
import 'package:provider_mvc/view.dart';

class LaneView extends View<LaneController> {
  final TaskState state;

  LaneView(this.state) : super(LaneController());

  String get title {
    String t = '';
    switch (state) {
      case TaskState.todo:
        t = 'To Do';
        break;
      case TaskState.inprogress:
        t = 'In Progress';
        break;
      case TaskState.review:
        t = 'Review';
        break;
      case TaskState.done:
        t = 'Done';
        break;
    }
    return t;
  }

  Color get _stateColor {
    switch (state) {
      case TaskState.todo:
        return Colors.red;
        break;
      case TaskState.inprogress:
        return Colors.orange;
        break;
      case TaskState.review:
        return Colors.yellow;
        break;
      case TaskState.done:
        return Colors.green;
        break;
    }
    return Colors.transparent;
  }

  Widget _tasksListView(List<Task> tasks) {
    List<Widget> items = [];

    tasks.forEach((task) => items.add(TaskView(task)));

    items.add(Container(
      width: 200.0,
      height: 20.0,
      color: _stateColor,
    ));

    return Column(children: items);
  }

  @override
  Widget builder(
      BuildContext context, LaneController controller, Widget widget) {
    return Container(
      width: 200.0,
      child: Card(
        child: Column(
          children: [
            Align(
              child: Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Divider(height: 2.0, thickness: 2.0),
            ),
            DragTarget<Task>(
              builder: (context, candidateData, rejectedData) {
                if (controller.tasks == null)
                  return FutureBuilder(
                    future: TaskUtil.getTasks(state),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        controller.tasks = snapshot.data;
                        return _tasksListView(controller.tasks);
                      }
                      return CircularProgressIndicator();
                    },
                  );
                return _tasksListView(controller.tasks);
              },
              onWillAccept: (task) => true,
              onAccept: (task) async {
                TaskState oldState = task.state;
                task.state = state;
                if (await TaskUtil.save(task)) {
                  projectBoardApp.lanes
                      .firstWhere((lane) => lane.state == oldState)
                      .controller
                      .removeTask(task);
                  controller.insertTask(task);
                } else {
                  task.state = oldState;
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
