import 'package:flutter/material.dart';
import '../dummy-data.dart';
import '../models/meal.dart';

class DetailMealPage extends StatelessWidget {
  static String routeName = '/DetailMealPage';
  @override
  Widget build(BuildContext context) {
    final String id = ModalRoute.of(context).settings.arguments as String;

    Meal selectedMeal = DUMMY_MEALS.firstWhere((element) => element.id == id);
    Widget buildSelectionTitle(text) {
      return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.title,
      ),
    );
    }

    Widget buildcontainer (Widget child) 
    { return Container(
                  width: 270,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: child,
                );
    }
        return Scaffold(
            appBar: AppBar(
              title: Text(selectedMeal.title),
            ),
            body: SingleChildScrollView(
                          child: Column(
                children: <Widget>[
                  Container(
                    child: Image.network(selectedMeal.imageUrl),
                  ),
                  buildSelectionTitle('Ingredient'),
                  buildcontainer(
                    ListView.builder(
                      itemBuilder: (ctx, index) {
                        return Card(
                          elevation: 1,
                          color: Colors.grey,
                          child: Padding(
                              padding:
                                  EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                              child: Text(selectedMeal.ingredients[index])),
                        );
                      },
                      
                      itemCount: selectedMeal.ingredients.length,
                    ),),
                    buildSelectionTitle('Steps'),
                    buildcontainer(
                     ListView.builder(itemBuilder: (ctc,index){
                       return Column(
                         children: <Widget>[
                           ListTile(
                             leading: CircleAvatar(
                               
                               child:Text('# ${index+1}'),
                             ),
                             title:Text(selectedMeal.steps[index]) ,
                           ),
                           Divider()
                         ],
                       );
                     },
                     itemCount: selectedMeal.steps.length,
                     
                     ) 
                    )

          ],
        ),
            ));
  }
}
