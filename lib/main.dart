import 'package:flutter/material.dart';
import 'package:mealapp/screens/filter.dart';
import './screens/categoryList_screen.dart';
import './screens/SelectedCategoryPage.dart';
import './screens/meal_details_screen.dart';
import './screens/tabs_screen_bottombar.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
      initialRoute:'/' ,
      routes: {
        '/' : (context)=>TabScreen(),
        // CategoryScreen.routeName: (context) => CategoryScreen(),
         SelectedCategoryPage.routeName: (context) => SelectedCategoryPage(),
         DetailMealPage.routeName:(context)=>DetailMealPage(),
         FilterScreen.routeName:(context)=>FilterScreen(),
      },
      onGenerateRoute: (setting) => MaterialPageRoute(builder: (ctx)=>CategoryScreen()),  // if some error occurs while navigating to a route 

      onUnknownRoute: (setting)=> MaterialPageRoute(builder: (ctx)=>CategoryScreen()), // if onGenerateRoute is missing or fail to load the page then it is called
    );
  }
}
