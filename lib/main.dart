import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/home_page.dart';
import 'package:to_do_list_app/to_do_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'To Do List App Flutter';

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => ToDoListProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: title,
          theme: ThemeData(
            primarySwatch: Colors.pink,
            scaffoldBackgroundColor: Color(0xFFf6f5ee),
          ),
          home: HomePage(),
        ),
      );
}
