import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/favorites_screen.dart';
import 'package:meals_app/widget/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
        length: 2,
        child: Scaffold(
          drawer:  MainDrawer(),
          appBar: AppBar(
            centerTitle: true,
            title: const Text("Meals App",style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold
            ),),
            bottom: const TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.category),
                  text: "Categories",
                ),
                Tab(
                  icon: Icon(Icons.favorite),
                  text: "Favorites",
                ),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              CategoriesScreen(),
              FavoritesScreen(),
            ],
          ),
        ));
  }
}
