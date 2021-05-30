import 'package:flutter/cupertino.dart';

class ToDoField {
  static const createdTime = 'createdTime';
}

class ToDo {
  DateTime createdTime;
  String title;
  String id;
  String description;
  bool isDone;

  ToDo({
    @required this.createdTime,
    @required this.title,
    this.description = '',
    this.id,
    this.isDone = false,
  });
}
