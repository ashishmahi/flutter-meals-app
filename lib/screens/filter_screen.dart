import 'package:flutter/material.dart';
import 'package:meals_app/widgets/app_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filter';
  final Function setFilters;

  final Map<String, bool> filters;

  FilterScreen(this.setFilters, this.filters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFree = false;

  var _vegetarian = false;

  var _vegan = false;

  var _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.filters['gluten'];
    _vegetarian = widget.filters['vegetarian'];
    _vegan = widget.filters['vegan'];
    _lactoseFree = widget.filters['lactose'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your filters'),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                widget.setFilters({
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian,
                });
              })
        ],
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your selection',
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                buildSwitchListTile('Gluten-free', _glutenFree, (val) {
                  setState(() {
                    _glutenFree = val;
                  });
                }),
                buildSwitchListTile('Vegetarian', _vegetarian, (val) {
                  setState(() {
                    _vegetarian = val;
                  });
                }),
                buildSwitchListTile('Vegan', _vegan, (val) {
                  setState(() {
                    _vegan = val;
                  });
                }),
                buildSwitchListTile('Lactose Free', _lactoseFree, (val) {
                  setState(() {
                    _lactoseFree = val;
                  });
                }),
              ],
            ))
          ],
        ),
      ),
    );
  }

  SwitchListTile buildSwitchListTile(
      String title, bool currentValue, Function updateValue) {
    return SwitchListTile.adaptive(
      title: Text(title),
      value: currentValue,
      onChanged: updateValue,
      subtitle: Text('Only include $title'),
    );
  }
}
