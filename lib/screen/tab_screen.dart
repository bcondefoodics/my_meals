import 'package:flutter/material.dart';
import 'package:my_meals/screen/categories_screen.dart';
import 'package:my_meals/screen/meals_screen.dart';
import 'package:my_meals/widget/main_drawer.dart';

import '../model/meal.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() {
    return _TabScreenState();
  }
}

class _TabScreenState extends State<TabScreen> {
  int _selectedPageIndex = 0;
  final List<Meal> _favoriteMeals = [];

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _toggleFavorite(Meal meal) {
    bool isExisting = _favoriteMeals.contains(meal);
    String snackBarMessage = '';
    setState(() {
      if (isExisting) {
        _favoriteMeals.remove(meal);
        snackBarMessage = 'Meal is removed';
      } else {
        _favoriteMeals.add(meal);
        snackBarMessage = 'Meal is added';
      }
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(snackBarMessage), duration: Duration(seconds: 2)),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesScreen(onToggleFavorite: _toggleFavorite);
    var activePageTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      activePage = MealsScreen(
        meals: _favoriteMeals,
        onToggleFavorite: _toggleFavorite,
      );
      activePageTitle = 'Favorites';
    }

    return Scaffold(
      drawer: Drawer(child: MainDrawer()),
      appBar: AppBar(title: Text(activePageTitle)),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
