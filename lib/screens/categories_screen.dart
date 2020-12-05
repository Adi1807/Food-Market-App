import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  /*  return Scaffold(
      appBar: AppBar(
        title: const Text('DeliMeal'),
      ),
      body: */
      return GridView(
        padding: EdgeInsets.all(20),
        children: DUMMY_CATEGORIES
            .map((catData) => CategoryItem(
                  catData.id,
                  catData.title,
                  catData.color,
                ))
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          //Here, Sliver means Scrolling with Max width
          maxCrossAxisExtent: 200, //Width
          childAspectRatio: 3 / 2, // If 200 width so 300 height
          crossAxisSpacing: 20,
          mainAxisSpacing: 20, //these 2 for spacing between rows and columns
        ),
      );
    //);
  }
}
