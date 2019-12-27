import "package:flutter/material.dart";
import './categoryList_screen.dart';
import './favorites.dart';
import '../models/meal.dart';
class TabScreen extends StatefulWidget {
  final List<Meal> fav;
  TabScreen(this.fav);
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Meals'),
          bottom: TabBar(tabs: <Widget>[
            Tab(
              icon: Icon(Icons.category),
              text: 'Categories',
            ),
            Tab(
              icon:Icon(Icons.star),
              text: 'Favorites',
            ),


          ],),
        ),
        body: TabBarView(children: <Widget>[
          CategoryScreen(),
          FavScreen(widget.fav),
        ],),
      ),);
  }
}