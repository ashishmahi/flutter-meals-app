import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/category_meals_screen.dart';
import 'package:meals_app/screens/category_screen.dart';
import 'package:meals_app/screens/filter_screen.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';
import 'package:meals_app/screens/tab_bar_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favorteMeals = [];

  void _toggleFavorite(String mealId) {
    final existingMealIndex =
        _favorteMeals.indexWhere((element) => element.id == mealId);
    if (existingMealIndex >= 0) {
      setState(() {
        _favorteMeals.removeAt(existingMealIndex);
      });
    } else {
      setState(() {
        _favorteMeals
            .add(DUMMY_MEALS.firstWhere((element) => element.id == mealId));
      });
    }
  }

  bool _isMealFavorite(String mealId) {
    return _favorteMeals.any((element) => element.id == mealId);
  }

  void _setFilters(Map<String, bool> filters) {
    setState(() {
      _filters = filters;
      _availableMeals = DUMMY_MEALS.where((element) {
        if (_filters['gluten'] && !element.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !element.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !element.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !element.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals App',
      theme: ThemeData(
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              bodyText2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              headline1: TextStyle(
                  fontFamily: 'RobotoCondensed',
                  fontSize: 20,
                  fontWeight: FontWeight.bold))),
      initialRoute: '/',
      routes: {
        '/': (_) => TabBarScreen(_favorteMeals),
        CategoryMeals.routeName: (_) => CategoryMeals(_availableMeals),
        MealDetailScreen.routeName: (_) =>
            MealDetailScreen(_toggleFavorite, _isMealFavorite),
        FilterScreen.routeName: (_) => FilterScreen(_setFilters, _filters)
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (_) {
          return CategoryScreen();
        });
      },
    );
  }
}
