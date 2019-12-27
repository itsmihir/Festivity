import 'package:flutter/material.dart';
import '../widgets/drawer.dart';

class FilterScreen extends StatefulWidget {
  static String routeName = '/filter';
  final Function setFilter;
  final Map<String, bool> currentFilters;
  FilterScreen(this.currentFilters, this.setFilter);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var isGlutenFree = false;
  var isVegetarian = false;
  var isLactoseFree = false;
  var isVegan = false;

  @override
  void initState() {
    isLactoseFree = widget.currentFilters['lactose'];
    isVegan = widget.currentFilters['isvegan'];
    isVegetarian = widget.currentFilters['vegetarian'];
    isGlutenFree = widget.currentFilters['gluten'];

    super.initState();
  }
  

  Widget build(BuildContext context) {
    Widget switchListTile(
        String text1, String text2, var filter, Function updatevalue) {
      return SwitchListTile(
        title: Text(text1),
        value: filter,
        subtitle: Text(text2),
        onChanged: updatevalue,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Filter'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten': isGlutenFree,
                'vegetarian': isVegetarian,
                'isvegan': isVegan,
                'lactose': isLactoseFree,
              };
              widget.setFilter(selectedFilters);
            },
          )
        ],
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
                switchListTile('Vegan', 'Only include Vegan Meals', isVegan,
                    (newVlaue) {
                  setState(() {
                    isVegan = newVlaue;
                  });
                }),
                switchListTile(
                    'Vegetarian', 'Only include Vegetarian Meals', isVegetarian,
                    (newVlaue) {
                  setState(() {
                    isVegetarian = newVlaue;
                  });
                }),
                switchListTile('Gluten Free', 'Only include Gluten Free Meals',
                    isGlutenFree, (newVlaue) {
                  setState(() {
                    isGlutenFree = newVlaue;
                  });
                }),
                switchListTile(
                    'Lactose Free',
                    'Only include Lactose Free Meals',
                    isLactoseFree, (newVlaue) {
                  setState(() {
                    isLactoseFree = newVlaue;
                  });
                }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
