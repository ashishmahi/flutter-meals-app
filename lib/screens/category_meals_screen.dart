import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/widgets/meal_item.dart';

class CategoryMeals extends StatelessWidget {
  static const routeName = '/category-meals';
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final String title = routeArgs['title'];
    final String id = routeArgs['id'];
    final categories = DUMMY_MEALS
        .where((element) => element.categories.contains(id))
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (_, index) {
            return MealItem(
              affordability: categories[index].affordability,
              complexity: categories[index].complexity,
              duration: categories[index].duration,
              imageUrl: categories[index].imageUrl,
              title: categories[index].title,
              id: categories[index].id,
            );
          },
          itemCount: categories.length,
        ),
      ),
    );
  }
}
