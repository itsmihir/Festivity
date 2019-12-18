import 'package:flutter/material.dart';
import '../screens/filter.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child:Column(children: <Widget>[
        Container(
          height: 120,
          width: double.infinity,
          padding: EdgeInsets.all(10),
          color: Colors.yellow,
          alignment: Alignment.centerLeft,
          child: Text('Never Stop Building',style:TextStyle(
            fontFamily: 'RobotoCondense',
            fontWeight:FontWeight.bold,
            fontSize:30,
            color:Colors.red
          )
          )
          ,
        ),
        SizedBox(height: 20,),

        ListTile(
          leading: Icon(Icons.restaurant , size: 26,),
          title: Text('Meals',style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
          onTap: ()=>Navigator.pushNamed(context, '/'),
        ),
        ListTile(
          leading: Icon(Icons.settings,size: 26,),
          title: Text('Filter',style:TextStyle(fontSize:24,fontWeight:FontWeight.bold)),
          onTap: ()=>Navigator.pushNamed(context, FilterScreen.routeName),
        )
    ],
    )
    );
  }
}