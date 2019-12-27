import 'package:flutter/material.dart';
import '../dummy-data.dart';
import '../models/meal.dart';

class DetailMealPage extends StatelessWidget {
  final Function toggleFav;
  final Function isfav;
  DetailMealPage(this.toggleFav,this.isfav);
  static String routeName = '/DetailMealPage';
  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context).settings.arguments as Map;
    Meal selectedMeal = DUMMY_MEALS.firstWhere((element) => element.id == data['id']);
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
                  width: 300,
                  height: 200,
                  decoration: BoxDecoration(

                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: child,
                );
    }
        return Scaffold(
            appBar: AppBar(
              backgroundColor: data['color'],
              title: Text(selectedMeal.title),
            ),
            body: SingleChildScrollView(
                          child: Column(
                children: <Widget>[
                  Card(
                    margin: EdgeInsets.all(10),
                    elevation: 6,
                      child: Container(
                      height: 200,
                      width:double.infinity,
                      child: Image.network(selectedMeal.imageUrl,fit: BoxFit.cover,),
                    ),
                  ),
                  buildSelectionTitle('Ingredient'),
                  buildcontainer(
                    ListView.builder(
                      itemBuilder: (ctx, index) {
                        return Card(
                          elevation: 1,
                          color: data['color'],
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
                               backgroundColor: data['color'],
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
       //   Navigator.of(context).pop(data['id']);
        toggleFav(data['id']);
        },
        child: Icon(
          isfav(data['id'])?Icons.star:Icons.star_border,

          ),
      ),
            );
  }
}
