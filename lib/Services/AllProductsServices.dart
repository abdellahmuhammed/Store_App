// ignore_for_file: file_names

import 'dart:developer';

import 'package:store_app/constant.dart';
import 'package:store_app/models/products.dart';

class AllProductsServices {
  Future<List<dynamic>> getAllProducts() async {
    var response = await dio.get('$baseUrl/products');

    if (response.statusCode == 200) {
      List<dynamic> jonsData = response.data;

      List<ProductsModel> productsList = [];

      for (int i = 0; i < jonsData.length; i++) {
        productsList.add(ProductsModel.fromJson(jonsData[i]));
      }
      log(productsList.toString());
      return productsList;
    } else {
      throw Exception('Error happened in states code ${response.statusCode}');
    }
  }
}
