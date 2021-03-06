import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routeName = '/meal-detail';
  final Function toggleFavorite;
  final Function isFavorite;

  MealDetailsScreen(this.toggleFavorite, this.isFavorite);

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        child: Text(text, style: Theme.of(context).textTheme.headline1));
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10.0)),
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(10.0),
      height: 150.0,
      width: 300.0,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            height: 300.0,
            width: double.infinity,
            child: Image.network(selectedMeal.imageUrl!, fit: BoxFit.cover),
          ),
          buildSectionTitle(context, 'Ingredients'),
          buildContainer(ListView.builder(
            itemBuilder: (context, index) => Card(
              color: Theme.of(context).primaryColorLight,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                child: Text(selectedMeal.ingredients![index]),
              ),
            ),
            itemCount: selectedMeal.ingredients!.length,
          )),
          buildSectionTitle(context, 'Steps'),
          buildContainer(ListView.builder(
            itemBuilder: (context, index) => Column(children: [
              ListTile(
                leading: CircleAvatar(child: Text('# ${(index + 1)}')),
                title: Text(selectedMeal.steps![index]),
              ),
              const Divider()
            ]),
            itemCount: selectedMeal.steps!.length,
          ))
        ],
      )),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isFavorite(mealId) ? Icons.star : Icons.star_border,
        ),
        onPressed: () => toggleFavorite(mealId),
      ),
    );
  }
}
