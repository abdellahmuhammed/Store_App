// ignore_for_file: file_names

import 'dart:developer';
import 'package:store_app/models/ProductsModel.dart';
import 'package:store_app/shared/constant.dart';
import 'package:store_app/helper/Api.dart';

class AllProductsServices {
  Future<List<ProductsModel>> getAllProducts() async {
    List<dynamic> jsonData = await Api().get(url: '$baseUrl/products');

    List<ProductsModel> productsList = [];
    
    for (int i = 0; i < jsonData.length; i++) {
      productsList.add(ProductsModel.fromJson(jsonData[i]));
    }
    log(productsList.toString());
    return productsList;
  }
}
