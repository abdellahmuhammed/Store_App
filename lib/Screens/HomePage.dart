// ignore_for_file: file_names

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:store_app/Services/AddProdactServices.dart';
import 'package:store_app/Services/UpdateProductServices.dart';
import 'package:store_app/helper/Api.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var data = await UpdateProductServices().updateProduct(
              id: 15,
              title: 'title',
              price: 'price',
              description: 'description',
              image: 'image',
              category: 'category');
          log(data.toString());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
