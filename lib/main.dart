import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy.dart';

import 'package:meals_app/screens/tabs_screen.dart';

import 'models/meal.dart';
import 'screens/category_meals_screen.dart';
import 'screens/filter_screen.dart';
import 'screens/meal_details_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    "gluten": false,
    "lactose": false,
    "vegan": false,
    "vegetarian": false,
  };

  List<Meal> _availableMeals = dummyMeals;

  setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = dummyMeals.where((meal) {
        if (_filters["gluten"]! && !meal.isGlutenFree) {
          return false;
        }
        if (_filters["lactose"]! && !meal.isLactoseFree) {
          return false;
        }
        if (_filters["vegan"]! && !meal.isVegan) {
          return false;
        }
        if (_filters["vegetarian"]! && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        canvasColor: const Color.fromARGB(255, 245, 238, 176),
        fontFamily: "Raleway",
      ),
      // colorScheme: ColorScheme.fromSwatch()
      // .copyWith(secondary: Colors.amber)

      //home: const TabsScreen(),
      initialRoute: '/', // default is '/'
      routes: {
        '/': (ctx) => TabsScreen(),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(
              availableMeals: _availableMeals,
            ),
        MealDetailsScreen.routeName: (ctx) => MealDetailsScreen(),
        FilterScreen.routeName: (ctx) => FilterScreen(setFilters,_filters),
      },
    );
  }
}
