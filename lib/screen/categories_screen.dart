import 'package:flutter/material.dart';
import 'package:my_meals/data/dummy_data.dart';

import '../widget/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Categories")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            childAspectRatio: 1.5,
            mainAxisSpacing: 20,
          ),
          children: [
            ...availableCategories.map((category) {
              return CategoryGridItem(category: category);
            }),
          ],
        ),
      ),
    );
  }
}
