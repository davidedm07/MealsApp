import 'package:MealsApp/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatelessWidget {
  static final route = '/filters';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
      ),
      drawer: MainDrawer(),
    );
  }
}
