import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Utility {
  static void showSnackBar(BuildContext context, String text) =>
      Scaffold.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text(text)));
}
