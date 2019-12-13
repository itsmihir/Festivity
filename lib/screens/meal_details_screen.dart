import 'package:flutter/material.dart';

class DetailMealPage extends StatelessWidget {

 static String routeName= '/DetailMealPage';
  @override
  Widget build(BuildContext context) {
    final String id = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text(id),
      ),

    );
  }
}