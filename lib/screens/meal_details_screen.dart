import 'package:ecommerce_app/models/meal.dart';
import 'package:flutter/material.dart';

class MealDetalisScrees extends StatelessWidget {
  const MealDetalisScrees({super.key});

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)?.settings.arguments as Meal;

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: const Center(
        child: Text('Detalhes da Receita'),
      ),
    );
  }
}
