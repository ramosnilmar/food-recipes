import 'package:ecommerce_app/components/main_app_bar.dart';
import 'package:ecommerce_app/models/meal.dart';
import 'package:flutter/material.dart';

class MealDetailsScrees extends StatelessWidget {
  const MealDetailsScrees({
    super.key,
    required this.onToggleFavorite,
    required this.isFavorite,
  });

  final Function(Meal) onToggleFavorite;
  final bool Function(Meal) isFavorite;

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
      width: 350,
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
      appBar: MainAppBar(title: meal.title),
      body: SingleChildScrollView(
        child: Column(
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
            _createSectionTitle(
              context: context,
              title: 'Passos',
            ),
            _createSectionContainer(
                child: ListView.builder(
              itemCount: meal.steps.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('${index + 1}'),
                      ),
                      title: Text(meal.steps[index]),
                    ),
                    const Divider(),
                  ],
                );
              },
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isFavorite(meal) ? Icons.star : Icons.star_border,
          color: Colors.black,
        ),
        onPressed: () => onToggleFavorite(meal),
      ),
    );
  }
}
