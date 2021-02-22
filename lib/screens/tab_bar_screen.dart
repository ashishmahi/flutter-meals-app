import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/app_drawer.dart';
import './favorite_screen.dart';
import './category_screen.dart';

class TabBarScreen extends StatefulWidget {
  static const routeName = '/tab-bar';
  final List<Meal> favorteMeals;

  TabBarScreen(this.favorteMeals);

  @override
  _TabBarScreenState createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  int _selectedPageIndex = 0;
  List<Map<String, Object>> _pages = [];

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  void initState() {
    _pages = [
      {'title': 'Categories', 'page': CategoryScreen()},
      {'title': 'Your Favorite', 'page': FavoriteScreen(widget.favorteMeals)},
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_pages[_selectedPageIndex]['title']),
        ),
        drawer: AppDrawer(),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).primaryColor,
          currentIndex: _selectedPageIndex,
          selectedItemColor: Theme.of(context).accentColor,
          unselectedItemColor: Colors.white,
          onTap: _selectPage,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'Favorites',
            )
          ],
        ),
        body: _pages[_selectedPageIndex]['page']);
  }
}
