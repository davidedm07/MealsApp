import 'package:MealsApp/dummy_data.dart';
import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  static const route = '/meal-detail';

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget _buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 150,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final meal = DUMMY_MEALS.firstWhere((element) => element.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text('${meal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            _buildSectionTitle(context, 'Ingredients'),
            _buildContainer(
              ListView.builder(
                itemBuilder: (context, index) => Card(
                  color: Colors.amber,
                  child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      child: Text(meal.ingredients[index])),
                ),
                itemCount: meal.ingredients.length,
              ),
            ),
            _buildSectionTitle(context, 'Steps'),
            _buildContainer(ListView.builder(
              itemBuilder: (context, index) => Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      child: Text('${index + 1}'),
                    ),
                    title: Text('${meal.steps[index]}'),
                  ),
                  Divider(),
                ],
              ),
              itemCount: meal.steps.length,
            )),
          ],
        ),
      ),
    );
  }
}
