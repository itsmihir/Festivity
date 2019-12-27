import 'package:flutter/material.dart';
import 'package:mealapp/screens/filter.dart';
import './screens/categoryList_screen.dart';
import './screens/SelectedCategoryPage.dart';
import './screens/meal_details_screen.dart';
import './screens/tabs_screen_bottombar.dart';
import './models/meal.dart';
import './dummy-data.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filter = {
    'gluten': false,
    'vegetarian': false,
    'isvegan': false,
    'lactose': false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> fav =[];

  void _toggleFav(id) {
    var existingIndex = fav.indexWhere((meal) => meal.id == id);
    if (existingIndex >= 0) {
      setState(() {
        fav.removeAt(existingIndex);
      });
    } else {
      setState(() {
        fav.add(DUMMY_MEALS.firstWhere((meal) => meal.id == id));
      });
    }
  }
bool _isMealFav(id){
  return fav.any((meal)=>meal.id==id);
}
  void _setfilter(Map<String, bool> filterData) {
    setState(() {
      print(filterData);
      _filter = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filter['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filter['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        if (_filter['isvegan'] && !meal.isVegan) {
          return false;
        }
        if (_filter['lactose'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        accentColor: Colors.red,
        canvasColor: Color.fromRGBO(255, 245, 233, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            body1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
            body2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
            title: TextStyle(
              fontSize: 19,
              fontFamily: 'RobotoCondense',
            )),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => TabScreen(fav),
        // CategoryScreen.routeName: (context) => CategoryScreen(),
        SelectedCategoryPage.routeName: (context) =>
            SelectedCategoryPage(_availableMeals),
        DetailMealPage.routeName: (context) => DetailMealPage(_toggleFav,_isMealFav),
        FilterScreen.routeName: (context) => FilterScreen(_filter, _setfilter),
      },
      onGenerateRoute: (setting) => MaterialPageRoute(
          builder: (ctx) =>
              CategoryScreen()), // if some error occurs while navigating to a route

      onUnknownRoute: (setting) => MaterialPageRoute(
          builder: (ctx) =>
              CategoryScreen()), // if onGenerateRoute is missing or fail to load the page then it is called
    );
  }
}
