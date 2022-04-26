import 'package:flutter/material.dart';
import 'package:meals_app/screens/filter_screen.dart';
import 'package:meals_app/screens/tabs_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({ Key? key }) : super(key: key);

  Widget buildListTile(String title,IconData icon,void Function() tapHandler){
    return  ListTile(
            leading:  Icon(icon,size: 26,color: Colors.black,),
            title:  Text(title,style: const TextStyle(
              fontFamily: "RobotoCondensed",
              fontSize: 22,
              fontWeight: FontWeight.w600
            ),),
            onTap:  tapHandler,
          );
  }
  

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            color: Colors.white,
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: const Text("Cooking Up!",style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 30,
            ),),
          ),
          const SizedBox(
            height: 20,
          ),
         buildListTile("Meals", Icons.restaurant,
         (){
           Navigator.of(context).pushReplacementNamed('/');
         }
         ),
         buildListTile("Filter meals", Icons.filter_list_alt,
         (){
           Navigator.of(context).pushNamed(FilterScreen.routeName);
         }
         )
        ],
      ),
    );
  }
}