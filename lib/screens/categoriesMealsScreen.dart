import 'package:flutter/material.dart';
import 'package:menu/data/dummy_data.dart';
import 'package:menu/models/category.dart';
import 'package:menu/models/meal.dart';
import 'package:menu/components/meal_item.dart';

class CategoriesMealsScreen extends StatelessWidget {
  //final Category category;

  //const CategoriesMealsScreen();

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)?.settings.arguments as Category;

    final categoriesMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ListView.builder(
        itemCount: categoriesMeals.length,
        itemBuilder: (context, index) {
          return MealItem(categoriesMeals[index]);
        },
      ),
    );
  }
}
