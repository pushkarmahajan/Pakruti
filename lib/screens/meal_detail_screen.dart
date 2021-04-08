import 'package:flutter/material.dart';
import 'package:pakruti/dummy.dart';

class MealDetailScreen extends StatelessWidget {
  static const RouteName = '/MealDetailScreen';

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal =
        DUMMY_MEALS.firstWhere((element) => element.id == mealId);
    return Scaffold(
        appBar: AppBar(
          title: Text('$mealId'),
        ),
        body: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            )
          ],
        ));
  }
}
