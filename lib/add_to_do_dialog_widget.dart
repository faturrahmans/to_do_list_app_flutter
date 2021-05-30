import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/to_do.dart';
import 'package:to_do_list_app/to_do_form_widget.dart';
import 'package:to_do_list_app/to_do_list.dart';

class AddToDoDialogWidget extends StatefulWidget {
  @override
  _AddToDoDialogWidgetState createState() => _AddToDoDialogWidgetState();
}

class _AddToDoDialogWidgetState extends State<AddToDoDialogWidget> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';

  @override
  Widget build(BuildContext context) => AlertDialog(
          content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tambahkan List',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            const SizedBox(height: 8),
            ToDoFormWidget(
              onChangedTitle: (title) => setState(() => this.title = title),
              onChangedDescription: (description) =>
                  setState(() => this.description = description),
              onSavedToDo: addToDo,
            ),
          ],
        ),
      ));
  void addToDo() {
    final isValid = _formKey.currentState.validate();
    if (!isValid) {
      return;
    } else {
      final todo = ToDo(
        id: DateTime.now().toString(),
        title: title,
        description: description,
        createdTime: DateTime.now(),
      );
      final provider = Provider.of<ToDoListProvider>(context, listen: false);
      provider.addToDo(todo);
      Navigator.of(context).pop();
    }
  }
}
