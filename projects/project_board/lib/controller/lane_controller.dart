import 'package:project_board/model/task.dart';
import 'package:provider_mvc/controller.dart';

class LaneController extends Controller {
  List<Task> tasks;

  void insertTask(Task task) {
    if (tasks == null) tasks = [];
    tasks.add(task);
    update();
  }

  void removeTask(Task task) {
    tasks.remove(task);
    update();
  }
}
