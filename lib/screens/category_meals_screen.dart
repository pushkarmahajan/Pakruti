import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pakruti/widgets/meal_item.dart';
import '../dummy.dart';
import 'package:pakruti/model/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const RouteName = '/category-meal';
  final List<Meal> availableMeal;

  CategoryMealsScreen(this.availableMeal);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String title;
  List<Meal> displayedMeal;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    final routeArgs = ModalRoute.of(context).settings.arguments as Map;

    title = routeArgs['title'];
    final id = routeArgs['id'];
    displayedMeal = widget.availableMeal.where((meal) {
      return meal.categories.contains(id);
    }).toList();
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
     setState(() {
       displayedMeal.removeWhere((element) => element.id == mealId);
     });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
                id: displayedMeal[index].id,
                title: displayedMeal[index].title,
                imageUrl: displayedMeal[index].imageUrl,
                duration: displayedMeal[index].duration,
                complexity: displayedMeal[index].complexity,
                removeItem: _removeMeal,
                affordability: displayedMeal[index].affordability);

          },
          itemCount: displayedMeal.length,
        ));
  }
}
