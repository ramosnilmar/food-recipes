import 'package:food_recipes/components/main_app_bar.dart';
import 'package:food_recipes/components/meal_item.dart';
import 'package:food_recipes/models/category.dart';
import 'package:food_recipes/models/meal.dart';
import 'package:flutter/material.dart';

class CategoriesMealsScreen extends StatelessWidget {
  const CategoriesMealsScreen({super.key, required this.meals});

  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)?.settings.arguments as Category;

    final categoryMeals = meals.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();

    return Scaffold(
      appBar: MainAppBar(title: category.title),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (context, index) {
          return MealItem(
            meal: categoryMeals[index],
          );
        },
      ),
    );
  }
}
