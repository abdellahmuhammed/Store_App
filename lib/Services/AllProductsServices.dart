// ignore_for_file: file_names

import 'dart:developer';
import 'package:store_app/constant.dart';
import 'package:store_app/helper/Api.dart';
import 'package:store_app/models/products.dart';

class AllProductsServices {
  Future<List<dynamic>> getAllProducts() async {
    List<dynamic> jsonData = await Api().get(url: '$baseUrl/products');

    List<ProductsModel> productsList = [];
    
    for (int i = 0; i < jsonData.length; i++) {
      productsList.add(ProductsModel.fromJson(jsonData[i]));
    }
    log(productsList.toString());
    return productsList;
  }
}
