import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final Color color;
  final String title;
  final String id;

  CategoryItem({this.title, this.color, this.id});
  void _selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(CategoryMeals.routeName,
        arguments: {'id': id, 'title': title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline1,
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [color.withOpacity(0.7), color],
                end: Alignment.bottomRight,
                begin: Alignment.topLeft),
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
