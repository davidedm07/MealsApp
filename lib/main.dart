import 'package:MealsApp/dummy_data.dart';
import 'package:flutter/material.dart';

import 'models/meal.dart';
import 'screens/category_meals_screen.dart';
import 'screens/filters_screen.dart';
import 'screens/meal_detail_screen.dart';
import 'screens/tabs_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten-free': false,
    'lactose-free': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _meals = DUMMY_MEALS;
  List<Meal> _favouriteMeals = [];

  void _setFilters(Map<String, bool> filters, BuildContext context) {
    setState(() {
      _filters = filters;
      _meals =
          DUMMY_MEALS.where((element) => _checkProperties(element)).toList();
    });
    Navigator.of(context).pushReplacementNamed('/');
  }

  bool _isMealFavourite(String id) {
    return _favouriteMeals.any((meal) => meal.id == id);
  }

  bool _checkProperties(Meal meal) {
    if (!meal.isGlutenFree && _filters['gluten-free']) {
      return false;
    }
    if (!meal.isLactoseFree && _filters['lactose-free']) {
      return false;
    }
    if (!meal.isVegan && _filters['vegan']) {
      return false;
    }
    if (!meal.isVegetarian && _filters['vegetarian']) {
      return false;
    }

    return true;
  }

  void _toggleFavourite(String mealId) {
    final existingIndex =
        _favouriteMeals.indexWhere((meal) => meal.id == mealId);

    if (existingIndex >= 0) {
      setState(() {
        _favouriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favouriteMeals.add(_meals.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        accentColor: Colors.amberAccent,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText2: TextStyle(
              color: Colors.grey[700],
            ),
            headline6: TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
              fontStyle: FontStyle.italic,
            )),
      ),
      routes: {
        '/': (context) => TabsScreen(_favouriteMeals),
        CategoryMealsScreen.route: (context) => CategoryMealsScreen(_meals),
        MealDetailScreen.route: (context) =>
            MealDetailScreen(_toggleFavourite, _isMealFavourite),
        FiltersScreen.route: (context) => FiltersScreen(_setFilters, _filters),
      },
    );
  }
}
