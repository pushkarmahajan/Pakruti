import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///D:/flutter_projects/pakruti/lib/widgets/CategoryItem.dart';
import 'package:pakruti/dummy.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Pakruti'),), body:
   GridView(
      padding:const EdgeInsets.all(20),
      children:
      DUMMY_CATEGORIES.map((catData) => CategoryItem(catData.id,catData.title, catData.color)).toList()
      ,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
    ),) ;
  }
}
