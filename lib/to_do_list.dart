import 'package:flutter/cupertino.dart';
import 'package:to_do_list_app/to_do.dart';

class ToDoListProvider extends ChangeNotifier {
  List<ToDo> _todolist = [
    ToDo(
      createdTime: DateTime.now(),
      title: 'Pergi Kuliah',
      description: '''- Bangun Tidur😴
- Mandi🚿🛁
- Sarapan🍽️
- Pamit dengan OrangTua🙇🏻‍♂️
- Berangkat Ke kampus🚲''',
    ),
  ];

  List<ToDo> get todolist =>
      _todolist.where((todo) => todo.isDone == false).toList();

  List<ToDo> get todolistCompleted =>
      _todolist.where((todo) => todo.isDone == true).toList();

  void addToDo(ToDo todo) {
    _todolist.add(todo);

    notifyListeners();
  }

  void removeToDo(ToDo todo) {
    _todolist.remove(todo);

    notifyListeners();
  }

  bool toggleTodoStatus(ToDo todo) {
    todo.isDone = !todo.isDone;
    notifyListeners();

    return todo.isDone;
  }

  void updateTodo(ToDo todo, String title, String description) {
    todo.title = title;
    todo.description = description;

    notifyListeners();
  }
}
