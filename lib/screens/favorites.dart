import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';


class FavScreen extends StatelessWidget {
  @override
  final List<Meal> fav;
  FavScreen(this.fav);
  Widget build(BuildContext context) {
    if(fav.isEmpty){
    return Center(
      child: Text('No Favorites'),
    );
    }else
    {
      return ListView.builder(
        itemBuilder: (context, index) {
          return MealItems(
            id: fav[index].id,
            title: fav[index].title,
            url: fav[index].imageUrl,
            affordability: fav[index].affordability,
            duration: fav[index].duration,
            color: Colors.blue,
          );
        },
        itemCount: fav.length,
      );
    }
  }
}