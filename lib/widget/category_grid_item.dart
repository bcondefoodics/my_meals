import 'package:flutter/material.dart';
import 'package:my_meals/model/category.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({super.key, required this.category});

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.white, category.color],
        ),
      ),
      child: Text(
        category.title,
        style: Theme.of(
          context,
        ).textTheme.titleLarge!.copyWith(color: Colors.black),
      ),
    );
  }
}
