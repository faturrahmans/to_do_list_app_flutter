import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/edit_to_do_page.dart';
import 'package:to_do_list_app/to_do.dart';
import 'package:to_do_list_app/to_do_list.dart';
import 'package:to_do_list_app/utility.dart';

class ToDoWidget extends StatelessWidget {
  final ToDo todo;

  const ToDoWidget({
    @required this.todo,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Slidable(
          actionPane: SlidableDrawerActionPane(),
          key: Key(todo.id),
          actions: [
            IconSlideAction(
              color: Colors.green,
              onTap: () => editToDo(context, todo),
              caption: 'Ubah',
              icon: Icons.edit,
            )
          ],
          secondaryActions: [
            IconSlideAction(
              color: Colors.red,
              caption: 'Hapus',
              onTap: () => deleteToDo(context, todo),
              icon: Icons.delete,
            )
          ],
          child: buildToDo(context),
        ),
      );

  Widget buildToDo(BuildContext context) => GestureDetector(
        onTap: () => editToDo(context, todo),
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.all(20),
          child: Row(
            children: [
              Checkbox(
                activeColor: Theme.of(context).primaryColor,
                checkColor: Colors.white,
                value: todo.isDone,
                onChanged: (_) {
                  final provider =
                      Provider.of<ToDoListProvider>(context, listen: false);
                  final isDone = provider.toggleTodoStatus(todo);
                  Utility.showSnackBar(
                    context,
                    isDone
                        ? 'Tugas Telah Selesai'
                        : 'Tugas Ditandai Belum Selesai',
                  );
                },
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      todo.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                        fontSize: 22,
                      ),
                    ),
                    if (todo.description.isEmpty)
                      Container(
                        margin: EdgeInsets.only(top: 4),
                        child: Text(
                          todo.description,
                          style: TextStyle(fontSize: 20, height: 1.5),
                        ),
                      )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
  void deleteToDo(BuildContext context, ToDo todo) {
    final provider = Provider.of<ToDoListProvider>(context, listen: false);
    provider.removeToDo(todo);
    Utility.showSnackBar(context, 'Tugas Telah Dihapus');
  }

  void editToDo(BuildContext context, ToDo todo) => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => EditToDoPage(todo: todo),
        ),
      );
}
