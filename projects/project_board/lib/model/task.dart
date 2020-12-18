import 'package:project_board/model/task_state.dart';

class Task {
  TaskState state;
  final String title, content;
  int id;

  Task(this.title, this.content, this.state, [this.id = -1]);

  String toJson() {
    String str = '{';
    str += '"title": "$title",';
    str += '"content": "$content",';
    str += '"state": "${state.toString().split('.')[1]}"';
    str += '}';
    return str;
  }
}
