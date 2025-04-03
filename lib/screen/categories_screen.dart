import 'package:flutter/material.dart';
import 'package:my_meals/data/dummy_data.dart';
import 'package:my_meals/model/category.dart';
import 'package:my_meals/model/meal.dart';
import 'package:my_meals/screen/meals_screen.dart';

import '../model/filters.dart';
import '../widget/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({
    super.key,
    required this.onToggleFavorite,
    required this.filters,
  });

  final Map<Filters, bool> filters;
  final void Function(Meal) onToggleFavorite;

  void _selectCategory(BuildContext context, Category category) {
    bool isGlutenEnabled =
        filters.entries.where((filter) {
          return (filter.key == Filters.gluten && filter.value);
        }).isNotEmpty;

    bool isLactoseEnabled =
        filters.entries.where((filter) {
          return (filter.key == Filters.lactose && filter.value);
        }).isNotEmpty;

    bool isVeganEnabled =
        filters.entries.where((filter) {
          return (filter.key == Filters.vegan && filter.value);
        }).isNotEmpty;

    bool isVegetarianEnabled =
        filters.entries.where((filter) {
          return (filter.key == Filters.vegetarian && filter.value);
        }).isNotEmpty;

    final List<Meal> filteredMeals =
        dummyMeals.where((meal) {
          bool isContainCategory = meal.categories.contains(category.id);

          if (isGlutenEnabled ||
              isVegetarianEnabled ||
              isVeganEnabled ||
              isLactoseEnabled) {
            if (meal.isGlutenFree && isGlutenEnabled && isContainCategory) {
              return true;
            } else if (meal.isVegetarian &&
                isVegetarianEnabled &&
                isContainCategory) {
              return true;
            } else if (meal.isVegan && isVeganEnabled && isContainCategory) {
              return true;
            } else if (meal.isLactoseFree &&
                isLactoseEnabled &&
                isContainCategory) {
              return true;
            } else {
              return false;
            }
          } else {
            return isContainCategory;
          }
        }).toList();

    print('Filtered meals ${filteredMeals}');
    print(
      '${isGlutenEnabled}, ${isLactoseEnabled}, ${isVeganEnabled}, ${isVegetarianEnabled}',
    );

    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (ctx) => MealsScreen(
              title: category.title,
              meals: filteredMeals,
              onToggleFavorite: onToggleFavorite,
            ),
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
