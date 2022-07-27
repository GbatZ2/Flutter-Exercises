import 'package:flutter/material.dart';
import 'package:meals/models/Meals.dart';

import '../screens/MealDetailScreen.dart';

class MealItem extends StatelessWidget {
  final String? id;
  final String? title;
  final String? imageUrl;
  final int? duration;
  final Complexity? complexity;
  final Affordability? affordability;

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return "Simple";
      case Complexity.Challenging:
        return "Challenging";
      case Complexity.Hard:
        return "Hard";
      default:
        return "Unknown";
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return "Affordable";
      case Affordability.Luxurious:
        return "Luxurious";

      case Affordability.Pricey:
        return "Pricey";

      default:
        return "Unknown";
    }
  }

  void selectMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(MealDetailsScreen.routeName, arguments: id)
        .then((result) {
      if (result != null) {
        //removeItem(result);
      }
    });
  }

  const MealItem(
      {this.id,
      this.title,
      this.imageUrl,
      this.duration,
      this.complexity,
      this.affordability});

  Widget itemRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon),
        const SizedBox(
          width: 6.0,
        ),
        Text(text)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => selectMeal(context),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          elevation: 4.0,
          margin: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        topRight: Radius.circular(15.0)),
                    child: Image.network(
                      imageUrl!,
                      height: 250.0,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 20.0,
                    right: 10.0,
                    child: Container(
                        width: 300.0,
                        color: Colors.black54,
                        padding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 20.0),
                        child: Text(title!,
                            style: const TextStyle(
                                fontSize: 26.0, color: Colors.white),
                            softWrap: true,
                            overflow: TextOverflow.fade)),
                  ),
                ],
              ),
              Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      itemRow(Icons.schedule, "$duration min"),
                      itemRow(Icons.work, complexityText),
                      itemRow(Icons.attach_money, affordabilityText)
                    ],
                  ))
            ],
          ),
        ));
  }
}
