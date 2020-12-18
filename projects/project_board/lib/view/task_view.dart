import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_board/main.dart';
import 'package:project_board/model/task.dart';
import 'package:project_board/util/task_util.dart';

class TaskView extends StatelessWidget {
  final Task _task;

  const TaskView(this._task);

  @override
  Widget build(BuildContext context) {
    return Draggable<Task>(
      feedback: Card(
        color: Colors.grey,
        child: Container(
          width: 200.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                _task.title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(_task.content)
            ]),
          ),
        ),
      ),
      child: Card(
        color: Colors.grey,
        child: Container(
          width: 200.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      _task.title,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.delete_forever, color: Colors.red),
                    onPressed: () async {
                      if (await TaskUtil.remove(_task)) {
                        projectBoardApp.lanes
                            .firstWhere((lane) => lane.state == _task.state)
                            .controller
                            .removeTask(_task);
                      }
                    },
                  )
                ],
              ),
              Text(_task.content)
            ]),
          ),
        ),
      ),
      childWhenDragging: Container(),
      data: _task,
    );
  }
}
