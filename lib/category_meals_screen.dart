import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context).settings.arguments as Map;
    final title = routeArgs['title'];
    final id = routeArgs['id'];
    return Scaffold(
      appBar: AppBar(title: Text(title),),
      body: Center(
        child: Text('The recipes for the ${id}'),
      ),
    );
  }
}
