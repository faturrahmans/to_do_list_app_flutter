import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/to_do_list.dart';
import 'package:to_do_list_app/to_do_widget.dart';

class CompletedListWidget extends StatelessWidget {
  const CompletedListWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ToDoListProvider>(context);
    final todolist = provider.todolistCompleted;
    return todolist.isEmpty
        ? Center(
            child: Text(
              'Tidak Ada Tugas Yang Diselesaikan',
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
