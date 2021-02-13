import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const route = '/category-meals';

  final List<Meal> meals;

  CategoryMealsScreen(this.meals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  Map<String, String> routeArguments;
  bool isInit = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeArguments =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = routeArguments['id'];

    final categoryMeals = this
        .widget
        .meals
        .where((meal) => meal.categories.contains(categoryId))
        .toList();
  }

  void _removeMeal(String mealId) {
    setState(() {
      categoryMeals.removeWhere((element) => element.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
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
            removeItem: _removeMeal,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
