import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  FavoriteScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: favoriteMeals.isEmpty
          ? Text('You do not have any favorites!')
          : ListView.builder(
              itemBuilder: (_, index) {
                return MealItem(
                  affordability: favoriteMeals[index].affordability,
                  complexity: favoriteMeals[index].complexity,
                  duration: favoriteMeals[index].duration,
                  imageUrl: favoriteMeals[index].imageUrl,
                  title: favoriteMeals[index].title,
                  id: favoriteMeals[index].id,
                );
              },
              itemCount: favoriteMeals.length,
            ),
    );
  }
}
