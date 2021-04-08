import 'package:flutter/material.dart';
import 'file:///D:/flutter_projects/pakruti/lib/screens/categories_screen.dart';
import 'file:///D:/flutter_projects/pakruti/lib/screens/category_meals_screen.dart';
import 'package:pakruti/screens/meal_detail_screen.dart';
import 'package:pakruti/screens/tab_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pakruti',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        accentColor: Colors.black54,
        canvasColor: Color.fromRGBO(255,254,229,1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          body1: TextStyle(color: Color.fromRGBO(20, 51, 52, 1),
          ),
          body2: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1)
          ),
          title: TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
          )
        )
      ),
      // home: CategoriesScreen(),
      initialRoute: '/Pakruti_home',
      routes: {
        '/Pakruti_home': (ctx) => TabsScreen(),
        CategoryMealsScreen.RouteName : (ctx) => CategoryMealsScreen(),
        MealDetailScreen.RouteName : (ctx) => MealDetailScreen(),
      },
      // onGenerateRoute: ,
    );
  }
}


