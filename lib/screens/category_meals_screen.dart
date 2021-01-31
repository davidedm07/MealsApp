import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  final String title;

  CategoryMealsScreen(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: Container(),
    );
  }
}
