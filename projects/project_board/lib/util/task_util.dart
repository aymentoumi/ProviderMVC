import 'dart:convert';

import 'package:project_board/model/task.dart';
import 'package:project_board/model/task_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TaskUtil {
  static Future<bool> save(Task task) async {
    if (task.id == -1) task.id = await _lastKey + 1;
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString('${task.id}', task.toJson());
  }

  static Future<bool> remove(Task task) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove('${task.id}');
  }

  static Task fromJson(int id, String data) {
    Map<String, dynamic> task = jsonDecode(data);

    TaskState state;
    switch (task['state']) {
      case ('todo'):
        state = TaskState.todo;
        break;
      case ('inprogress'):
        state = TaskState.inprogress;
        break;
      case ('review'):
        state = TaskState.review;
        break;
      case ('done'):
        state = TaskState.done;
        break;
    }

    return Task(task['title'], task['content'], state, id);
  }

  static Future<List<Task>> get tasks async {
    List<Task> _tasks = [];
    final prefs = await SharedPreferences.getInstance();
    prefs.getKeys().forEach(
        (key) => _tasks.add(fromJson(int.parse(key), prefs.getString(key))));
    return _tasks;
  }

  static Future<List<Task>> getTasks(TaskState state) async {
    List<Task> _tasks = await tasks;
    return _tasks.where((task) => task.state == state).toList();
  }

  static Future<int> get _lastKey async {
    final prefs = await SharedPreferences.getInstance();
    int max = 0;
    prefs.getKeys().forEach((key) => max = _max(max, int.parse(key)));
    return max;
  }

  static int _max(int a, int b) => (a > b) ? a : b;
}
