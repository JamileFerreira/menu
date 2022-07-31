import 'package:flutter/material.dart';
import '../data/dummy_data.dart';
import '../models/category.dart';
import '../components/meal_item.dart';

class CategoriesMealsScreen extends StatelessWidget {
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
