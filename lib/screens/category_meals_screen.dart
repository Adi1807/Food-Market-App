import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  final List<Meal> availableMeals;
  CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;
  var _loadedInitData = false;

  @override
  void initState() {
    super.initState();
  }

  // initState() ma context use nathi thato tethi didChangeDependenses vaparyu je darek page vakhate reload thase nai k only starting vakhate;
  // tethi initState() jevu banavava _loadedInitData vaparyu 6
  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      displayedMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(
            categoryId); // check the categoryId in the categories of meals
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  /*void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: displayedMeals[index].id,
              title: displayedMeals[index].title,
              complexity: displayedMeals[index].complexity,
              affordability: displayedMeals[index].affordability,
              duration: displayedMeals[index].duration,
              imageUrl: displayedMeals[index].imageUrl,
             // removeItem: _removeMeal,
            );
          },
          itemCount: displayedMeals.length,
        ));
  }
}
