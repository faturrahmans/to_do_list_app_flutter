import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/to_do.dart';
import 'package:to_do_list_app/to_do_form_widget.dart';
import 'package:to_do_list_app/to_do_list.dart';

class EditToDoPage extends StatefulWidget {
  final ToDo todo;
  EditToDoPage({Key key, @required this.todo}) : super(key: key);

  @override
  _EditToDoPageState createState() => _EditToDoPageState();
}

class _EditToDoPageState extends State<EditToDoPage> {
  final _formKey = GlobalKey<FormState>();
  String title;
  String description;
  @override
  void initState() {
    super.initState();
    title = widget.todo.title;
    description = widget.todo.description;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Edit To Do List'),
          actions: [
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                final provider =
                    Provider.of<ToDoListProvider>(context, listen: false);
                provider.removeToDo(widget.todo);
                Navigator.of(context).pop();
              },
            )
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: ToDoFormWidget(
              title: title,
              description: description,
              onChangedTitle: (title) => setState(() => this.title = title),
              onChangedDescription: (description) =>
                  setState(() => this.description),
              onSavedToDo: saveToDo,
            ),
          ),
        ),
      );
  void saveToDo() {
    final isValid = _formKey.currentState.validate();
    if (!isValid) {
      return;
    } else {
      final provider = Provider.of<ToDoListProvider>(context, listen: false);
      provider.updateTodo(widget.todo, title, description);
      Navigator.of(context).pop();
    }
  }
}
