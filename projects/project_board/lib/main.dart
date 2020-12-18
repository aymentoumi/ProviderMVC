import 'package:project_board/util/task_util.dart';
import 'package:project_board/view/lane_view.dart';
import 'package:project_board/model/task.dart';
import 'package:project_board/model/task_state.dart';
import 'package:flutter/material.dart';
import 'package:project_board/widget/text_field_widget.dart';

ProjectBoardApp projectBoardApp = ProjectBoardApp();

void main() => runApp(
      MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: projectBoardApp),
    );

class ProjectBoardApp extends StatelessWidget {
  final List<LaneView> lanes = [
    LaneView(TaskState.todo),
    LaneView(TaskState.inprogress),
    LaneView(TaskState.review),
    LaneView(TaskState.done),
  ];

  Future<Task> _addTaskDialog(BuildContext context) async {
    TextFieldView _titleTFV = TextFieldView(
      hint: 'Task Title',
    );

    TextFieldView _contentTFV = TextFieldView(
      hint: 'Task Content',
    );

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('New To Do Task'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                _titleTFV,
                _contentTFV,
              ],
            ),
          ),
          actions: [
            FlatButton(
              child: Text('Add'),
              onPressed: () {
                if (_titleTFV.text == '')
                  _titleTFV.controller.error = 'Required';
                if (_contentTFV.text == '')
                  _contentTFV.controller.error = 'Required';

                if (_titleTFV.text != '' && _contentTFV.text != '') {
                  Navigator.of(context).pop(
                      Task(_titleTFV.text, _contentTFV.text, TaskState.todo));
                }
              },
            ),
            FlatButton(
              child: Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(null),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Align(
            child: Text('Project Management Board'),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () async {
                final Task task = await _addTaskDialog(context);
                if (task != null) {
                  TaskUtil.save(task);
                  lanes[0].controller.insertTask(task);
                }
              },
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Wrap(
              children: lanes,
            ),
          ),
        ),
      );
}
