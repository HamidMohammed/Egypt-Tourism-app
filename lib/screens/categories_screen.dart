import 'package:flutter/material.dart';

import '../app_data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return
        // Scaffold(
        //   appBar: AppBar(
        //     title: Text('دليل سياحي'),
        //   ),
        //   body:
        GridView(
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 7 / 8,
      ),
      children: categories_data
          .map(
            (categorydata) => CategoryItem(
                categorydata.id, categorydata.title, categorydata.imageUrl),
          )
          .toList(),
    );
    // );
  }
}
