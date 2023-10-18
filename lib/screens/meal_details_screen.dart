import 'package:ecommerce_app/models/meal.dart';
import 'package:flutter/material.dart';

class MealDetalisScrees extends StatelessWidget {
  const MealDetalisScrees({super.key});

  Widget _createSectionTitle(
      {required BuildContext context, required String title}) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }

  Widget _createSectionContainer({required Widget child}) {
    return Container(
      width: 300,
      height: 200,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)?.settings.arguments as Meal;

    return Scaffold(
        appBar: AppBar(
          title: Text(meal.title),
        ),
        body: Column(
          children: <Widget>[
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.fill,
              ),
            ),
            _createSectionTitle(
              context: context,
              title: 'Ingredientes',
            ),
            _createSectionContainer(
              child: ListView.builder(
                  itemCount: meal.ingredients.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Theme.of(context).colorScheme.secondary,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 10,
                        ),
                        child: Text(
                          meal.ingredients[index],
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ));
  }
}
