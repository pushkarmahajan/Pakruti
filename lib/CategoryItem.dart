import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem( this.id, this.title, this.color);
  void selectCategory(BuildContext ctx){
    Navigator.of(ctx).pushNamed(
      '/category-meal', arguments: {'id': id, 'title' : title}
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {selectCategory(context);},
      child: Container(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.title,
          ),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(1),
              color.withOpacity(0.7),
              color.withOpacity(0.6)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
