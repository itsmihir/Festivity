import 'package:flutter/material.dart';
import './categoryList_screen.dart';
import '../dummy-data.dart';
import '../widgets/meal_item.dart';
import '../models/meal.dart';

class SelectedCategoryPage extends StatefulWidget {
  static String routeName = '/selected_category_page';

  @override
  _SelectedCategoryPageState createState() => _SelectedCategoryPageState();
}

class _SelectedCategoryPageState extends State<SelectedCategoryPage> {
  String title;
  Color color;
  String id;
  List<Meal> categoryMeals;
  var isLoaded = false;
 
  void _removeItem(String _id) {
    setState(() {
      categoryMeals.removeWhere((meal)=> meal.id==_id);
    });
  }
  @override
  void initState(){
    super.initState();
  }
  void didChangeDependencies(){
    if(!isLoaded)
    {
    final routeArg = ModalRoute.of(context).settings.arguments as Map;
      title = routeArg['title'];
      color = routeArg['color'];
      id = routeArg['id'];

     categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(id);
    }).toList();
    isLoaded=true;
    }
    super.didChangeDependencies();

  }
  Widget build(BuildContext context) {
    

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: color,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItems(
            id: categoryMeals[index].id,
            title: categoryMeals[index].title,
            url: categoryMeals[index].imageUrl,
            affordability: categoryMeals[index].affordability,
            duration: categoryMeals[index].duration,
            color: color,
            removedItem: _removeItem,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
