import 'package:flutter/material.dart';
import './categoryList_screen.dart';
import '../dummy-data.dart';

class SelectedCategoryPage extends StatelessWidget {
  static String routeName = '/selected_category_page';

  @override
  Widget build(BuildContext context) {
    final routeArg = ModalRoute.of(context).settings.arguments as Map;
    final String title = routeArg['title'];
    final Color color = routeArg['color'];
    final String id = routeArg['id'];

    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: color,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Text(categoryMeals[index].title);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
