import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart' ;
import 'package:meals_app/widgets/meal_item.dart';

class CategoryMeals extends StatefulWidget {
  static const routeName = '/category-meals';
  final List<Meal> availableMeals;

  CategoryMeals(this.availableMeals);

  @override
  _CategoryMealsState createState() => _CategoryMealsState();
}

class _CategoryMealsState extends State<CategoryMeals> {
  List<Meal> meals = [];
  String title = '';

  @override
  void didChangeDependencies() {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    title = routeArgs['title'];
    final String id = routeArgs['id'];
    meals = widget.availableMeals
        .where((element) => element.categories.contains(id))
        .toList();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (_, index) {
            return MealItem(
              affordability: meals[index].affordability,
              complexity: meals[index].complexity,
              duration: meals[index].duration,
              imageUrl: meals[index].imageUrl,
              title: meals[index].title,
              id: meals[index].id,
            );
          },
          itemCount: meals.length,
        ),
      ),
    );
  }
}
