import 'package:flutter/material.dart';
import './screens/categoryList_screen.dart';
import './screens/SelectedCategoryPage.dart';

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
              fontSize: 17,
              fontFamily: 'RobotoCondense',
            )),
      ),
      initialRoute: '/',
      routes: {
        CategoryScreen.routeName: (context) => CategoryScreen(),
        SelectedCategoryPage.routeName: (context) => SelectedCategoryPage(),
      },
    );
  }
}
