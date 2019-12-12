import 'package:flutter/material.dart';

class SelectedCategoryPage extends StatelessWidget {
  static String routeName = '/selected_category_page';

  @override
  Widget build(BuildContext context) {
    final routeArg = ModalRoute.of(context).settings.arguments as Map;
    final String title = routeArg['title'];
    final Color color = routeArg['color'];
    final String id = routeArg['id'];

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: color,
      ),
      body: Center(
        child: Text('Category selected page'),
      ),
    );
  }
}
