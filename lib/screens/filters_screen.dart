import 'package:flutter/material.dart';
import 'package:pakruti/widgets/main_drawer.dart';
class FiltersScreen extends StatelessWidget {
  static const RouteName = '/filterScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Filters'),),
      drawer: MainDrawer()
      ,
      body: Center(
        child: Text('Filters',style: TextStyle(fontSize: 50),),
      ),
    );
  }
}
