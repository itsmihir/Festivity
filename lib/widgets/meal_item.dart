import 'package:flutter/material.dart';
import 'package:mealapp/models/meal.dart';
import '../screens/meal_details_screen.dart';

class MealItems extends StatelessWidget {
  final String id;
  final String title;
  final String url;
  final Affordability affordability;
  final Complexity complexity;
  final int duration;

  MealItems(
      {
      this.title,
      this.url,
      this.affordability,
      this.complexity,
      this.duration,
      this.id,
      });

  String get complexitytext{
    if(complexity == Complexity.Simple)
    return 'Simple';

    if(complexity == Complexity.Challenging)
    return 'Challenging';

    if(complexity == Complexity.Hard)
    return 'Hard';

    return 'Unknown';
  }

  String get affordabilitytext{
    if(affordability == Affordability.Affordable)
    return 'Affordable';

    if(affordability == Affordability.Luxurious)
    return 'Luxurious';

    if(affordability == Affordability.Pricey)
    return 'Pricey';

    return 'Unknown';
  }



  @override
  Widget build(BuildContext context) {
      void gotoDetailPage(){
    Navigator.of(context).pushNamed(DetailMealPage.routeName ,arguments: id);

  }

    return InkWell(
        onTap: gotoDetailPage,
        child: Card(
          margin: EdgeInsets.all(15),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 50,
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  ClipRRect(
                    child: Image.network(url,
                        height: 250, width: double.infinity, fit: BoxFit.cover),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                  ),
                  Positioned(
                    bottom: 20,
                    right: 10,
                    child: Container(
                      color: Colors.black26,
                      width: 250,
                      height: 70,
                      padding: EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 20,
                      ),
                      child: Text(
                        title,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontFamily: 'Raleway'),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(Icons.schedule),
                        SizedBox(
                          width: 6,
                        ),
                        Text('${duration} min'),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.work),
                        SizedBox(
                          width: 6,
                        ),
                        Text(complexitytext),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.monetization_on),
                        SizedBox(
                          width: 6,
                        ),
                        Text(affordabilitytext),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
