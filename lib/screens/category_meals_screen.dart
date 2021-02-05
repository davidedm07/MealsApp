import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const route = '/category-meals';
  @override
  Widget build(BuildContext context) {
    final routeArguments =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    final categoryId = routeArguments['id'];

    final categoryMeals = DUMMY_MEALS
        .where((meal) => meal.categories.contains(categoryId))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(routeArguments['title']),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          var meal = categoryMeals[index];
          return MealItem(
            id: categoryMeals[index].id,
            title: meal.title,
            imageUrl: meal.imageUrl,
            affordability: meal.affordability,
            duration: meal.duration,
            complexity: meal.complexity,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
