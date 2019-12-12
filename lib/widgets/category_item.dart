import 'package:flutter/material.dart';
import '../screens/SelectedCategoryPage.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;
  final String id;

  CategoryItem(this.id, this.title, this.color);

  void selectCategory(context) {
    Navigator.of(context).pushNamed(SelectedCategoryPage.routeName,
        arguments: {'id': id, 'color': color, 'title': title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Text(
          title,
          style: Theme.of(context).textTheme.title,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [color.withOpacity(0.7), color],
              begin: Alignment.topCenter,
              end: Alignment.bottomLeft),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
