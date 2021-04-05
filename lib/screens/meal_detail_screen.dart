import 'package:flutter/material.dart';


class MealDetailScreen extends StatelessWidget {
  static const RouteName = '/MealDetailScreen';

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      appBar: AppBar(title: Text('$mealId'),),
      body: Container(
        child: Center(
          child: Text("Meal Screen for - $mealId"),
        ),
      ),
    );
  }
}
