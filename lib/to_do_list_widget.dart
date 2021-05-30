import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/to_do_list.dart';
import 'package:to_do_list_app/to_do_widget.dart';

class ToDoListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ToDoListProvider>(context);
    final todolist = provider.todolist;
    return todolist.isEmpty
        ? Center(
            child: Text(
              'Tidak Ada List',
              style: TextStyle(fontSize: 20),
            ),
          )
        : ListView.separated(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(16),
            separatorBuilder: (context, index) => Container(height: 8),
            itemCount: todolist.length,
            itemBuilder: (context, index) {
              final todo = todolist[index];

              return ToDoWidget(todo: todo);
            },
          );
  }
}
