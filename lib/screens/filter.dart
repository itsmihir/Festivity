import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  static String routeName = '/filter';

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var isGlutenFree = false;
  var isVegetarian = false;
  var isLactoseFree = false;
  var isVegan = false;

  @override
  Widget build(BuildContext context) {
    Widget switchListTile(String text1 , String text2 , var filter) {
      return SwitchListTile(
        title: Text(text1),
        value: filter,
        subtitle: Text(text2),
        onChanged: (newVlaue) {
          filter = newVlaue;
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Filter'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your Meal selection',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                switchListTile('Vegan','Only include Vegan Meals',isVegan),
                switchListTile('Vegetarian','Only include Vegetarian Meals',isVegetarian),
                switchListTile('Gluten Free','Only include Gluten Free Meals',isGlutenFree),
                switchListTile('Lactose Free','Only include Lactose Free Meals',isLactoseFree),
              ],
            ),
          )
        ],
      ),
    );
  }
}
