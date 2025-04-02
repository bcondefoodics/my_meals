import 'package:flutter/material.dart';
import 'package:my_meals/model/meal.dart';
import 'package:my_meals/screen/meal_detail_screen.dart';
import 'package:my_meals/widget/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.meals, this.title});

  final List<Meal> meals;
  final String? title;

  void _selectMeal(BuildContext context, Meal meal) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (ctx) => MealDetailScreen(meal: meal)),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemCount: meals.length,
      itemBuilder:
          (ctx, index) => MealItem(
            meal: meals[index],
            onSelectMeal: (mealObj) {
              _selectMeal(context, mealObj);
            },
          ),
    );

    if (meals.isEmpty) {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Oops, no meals at the moment',
              style: Theme.of(
                context,
              ).textTheme.titleLarge!.copyWith(color: Colors.white),
            ),
            SizedBox(height: 20),
            Text(
              'Select another category',
              style: Theme.of(
                context,
              ).textTheme.bodyMedium!.copyWith(color: Colors.white),
            ),
          ],
        ),
      );
    }

    if (title == null) {
      return content;
    }

    return Scaffold(appBar: AppBar(title: Text(title!)), body: content);
  }
}
