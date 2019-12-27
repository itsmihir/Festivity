import "package:flutter/material.dart";
import './categoryList_screen.dart';
import './favorites.dart';
import '../widgets/drawer.dart';
import './filter.dart';
import '../models/meal.dart';

class TabScreen extends StatefulWidget {
   List<Meal> fav;

  TabScreen(this.fav);
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {

   List<Map<String,Object>> _pages;
int _selectedPageNumber = 0;
  void _selectPage(int index)
  {
    setState(() {
      _selectedPageNumber = index;
    });
  }
  void initState(){
   _pages = [
  {'page': CategoryScreen(),
  'title':'Categories',
  },
  {
  'page':FavScreen(widget.fav),
  'title':'Favorities',
  }];
  // or copy inside the build method;
  super.initState();
  }
  @override
  
  Widget build(BuildContext context) {
   
    return  Scaffold(
        appBar: AppBar(
          title: Text(_pages[_selectedPageNumber]['title']),
          
        ),
        drawer: MyDrawer(),
        body:_pages[_selectedPageNumber]['page'],
        
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
           backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.red,
          currentIndex: _selectedPageNumber,         // to define the current page 
          type: BottomNavigationBarType.shifting,   // default is the fixed one 
          items: [
            BottomNavigationBarItem(
            
              icon: Icon(Icons.category),
              title: Text('Categories'),
              backgroundColor: Theme.of(context).primaryColor,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              title: Text('Favorities'),
              backgroundColor: Theme.of(context).primaryColor,
            )
          ],
        ),

        );
      
  }
}