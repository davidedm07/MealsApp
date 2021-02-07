import 'package:flutter/material.dart';

import 'screens/category_meals_screen.dart';
import 'screens/filters_screen.dart';
import 'screens/meal_detail_screen.dart';
import 'screens/tabs_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
        '/': (context) => TabsScreen(),
        CategoryMealsScreen.route: (context) => CategoryMealsScreen(),
        MealDetailScreen.route: (context) => MealDetailScreen(),
        FiltersScreen.route: (context) => FiltersScreen(),
      },
    );
  }
}
