import 'package:flutter/material.dart';
import 'package:pakruti/screens/filters_screen.dart';
import 'file:///D:/flutter_projects/pakruti/lib/screens/categories_screen.dart';
import 'file:///D:/flutter_projects/pakruti/lib/screens/category_meals_screen.dart';
import 'package:pakruti/screens/meal_detail_screen.dart';
import 'package:pakruti/screens/tab_screen.dart';
import 'dummy.dart';
import 'package:pakruti/model/meal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoritedMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((element) {
        if(_filters['gluten'] && !element.isGlutenFree){
          return false;
        }
        if(_filters['lactose'] && !element.isLactoseFree){
          return false;
        }
        if(_filters['vegan'] && !element.isVegan){
          return false;
        }
        if(_filters['vegetarian'] && !element.isVegetarian){
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavoirte(String mealId){
    final existingIndex =  _favoritedMeals.indexWhere((element) => element.id == mealId );
    print(existingIndex);
    if(existingIndex >= 0){
      setState(() {
        _favoritedMeals.removeAt(existingIndex);
      });
    }else{
      setState(() {
        _favoritedMeals.add(DUMMY_MEALS.firstWhere((element) => element.id == mealId));
      });
    }
  }//toggleFavorite

  bool _isMealFavorite(String id){
    return _favoritedMeals.any((element) => element.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pakruti',
      theme: ThemeData(
          primarySwatch: Colors.cyan,
          accentColor: Colors.black54,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 51, 52, 1),
              ),
              body2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              title: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ))),
      // home: CategoriesScreen(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(_favoritedMeals),
        CategoryMealsScreen.RouteName: (ctx) => CategoryMealsScreen(_availableMeals),
        MealDetailScreen.RouteName: (ctx) => MealDetailScreen(_toggleFavoirte, _isMealFavorite),
        FiltersScreen.RouteName: (ctx) => FiltersScreen(_filters,_setFilters),
      },
      // onGenerateRoute: ,
    );
  }
}
