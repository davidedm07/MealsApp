import 'package:MealsApp/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  static final route = '/filters';

  final Function _saveFilters;
  final Map<String, bool> _filters;

  FiltersScreen(
    this._saveFilters,
    this._filters,
  );

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  SwitchListTile _buildSwitchTile(title) {
    return SwitchListTile(
      title: Text('$title'),
      value: widget._filters[title],
      subtitle: Text('Only include $title meals.'),
      onChanged: (value) {
        setState(() {
          widget._filters[title] = value;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () => widget._saveFilters(
              widget._filters,
              context,
            ),
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              _buildSwitchTile('gluten-free'),
              _buildSwitchTile('vegetarian'),
              _buildSwitchTile('vegan'),
              _buildSwitchTile('lactose-free'),
            ],
          )),
        ],
      ),
    );
  }
}
