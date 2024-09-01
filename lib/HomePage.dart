// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:store_app/Services/AllCategoriesServices.dart';
import 'package:store_app/Services/AllProductsServices.dart';
import 'package:store_app/Services/CategoryServices.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
         AllProductsServices().getAllProducts();
          AllCategoriesServices().getAllCategories();
          CategoryServices().getCategory(categoryName: 'jewelery');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
