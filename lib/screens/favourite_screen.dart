import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavouriteScreen extends StatefulWidget {
  final List<Meal> _favouritesMeals;

  FavouriteScreen(this._favouritesMeals);

  @override
  _FavouriteScreenState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    if (widget._favouritesMeals.isEmpty) {
      return Center(
        child: Text('You have no favourites yet! Add some'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          var meal = widget._favouritesMeals[index];
          return MealItem(
            id: widget._favouritesMeals[index].id,
            title: meal.title,
            imageUrl: meal.imageUrl,
            affordability: meal.affordability,
            duration: meal.duration,
            complexity: meal.complexity,
          );
        },
        itemCount: widget._favouritesMeals.length,
      );
    }
  }
}
