import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/categories_grid_item.dart';
import 'package:meals/models/category.dart';

class Categories extends StatelessWidget{
  const Categories({
    super.key,

    required this.availableMeals
  });

  final List<Meal> availableMeals;

  void _selectcategory(BuildContext context, Category category){
    final filteredMeals = availableMeals
    .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
            title: category.title,
            meals: filteredMeals,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context){
    return GridView(
        padding: const EdgeInsets.all(24),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
          ),
        children: [
          //availableCategories.map((category) => CategoriesGridItem(category: category)).toList()
          for (final category in availableCategories)
            CategoriesGridItem(
              category: category,onSelectCategory: () {
              _selectcategory(context,category);
            },),
        ],
      );
  }
}