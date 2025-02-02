import 'package:flutter/material.dart';
import 'package:meals_tut/data/dummy_data.dart';
import 'package:meals_tut/models/category.dart';
import 'package:meals_tut/models/meal.dart';
import 'package:meals_tut/screens/meals.dart';
import 'package:meals_tut/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({
    super.key,
    required this.availableMeals,
  });

  final List<Meal> availableMeals;

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = availableMeals
        .where(
          (meal) => meal.categories.contains(category.id),
        )
        .toList();
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (ctx) => MealsScreen(
                title: category.title,
                meals: filteredMeals,
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        // availableCategories.map((category) => CategoryGridItem(category: category)) instead of map using for loop
        for (final category in availableCategories)
          CategoryGridItem(
            category: category,
            onSelectCategory: () => {
              _selectCategory(context, category),
            },
          )
      ],
    );
  }
}
