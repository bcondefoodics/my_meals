import 'package:flutter/material.dart';
import 'package:my_meals/data/dummy_data.dart';
import 'package:my_meals/model/category.dart';
import 'package:my_meals/model/meal.dart';
import 'package:my_meals/screen/meals_screen.dart';

import '../widget/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void _selectCategory(BuildContext context, Category category) {
    final List<Meal> filteredMeals =
        dummyMeals
            .where((meal) => meal.categories.contains(category.id))
            .toList();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (ctx) => MealsScreen(title: category.title, meals: filteredMeals),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            return CategoryGridItem(
              category: category,
              onSelectCategory: () {
                _selectCategory(context, category);
              },
            );
          }),
        ],
      ),
    );
  }
}
