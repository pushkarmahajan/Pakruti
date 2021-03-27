import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../dummy.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const RouteName = '/category-meal';

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute
        .of(context)
        .settings
        .arguments as Map;
    final title = routeArgs['title'];
    final id = routeArgs['id'];
    final categoryMeals = DUMMY_MEALS.where((meal)  {
      return meal.categories.contains(id);
  }).toList();
    return Scaffold(
    appBar: AppBar(title: Text(title),),
    body: ListView.builder(itemBuilder: (ctx, index){
      return Center(child: Text(categoryMeals[index].title));
    },
    itemCount: categoryMeals.length,)
    );
  }
}
