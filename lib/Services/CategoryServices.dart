// ignore_for_file: file_names

import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:store_app/constant.dart';
import 'package:store_app/models/products.dart';

class CategoryServices {
  Future<List<dynamic>> getCategory({required String categoryName}) async {
    Response response =
        await dio.get('$baseUrl/products/category/$categoryName');
    if (response.statusCode == 200) {
      List<dynamic> jsonData = response.data;
      List<ProductsModel> categoryList = [];
      for (int i = 0; i < jsonData.length; i++) {
        categoryList.add(ProductsModel.fromJson(jsonData[i]));
        log(categoryList.toString());
      }
      return categoryList;
    } else {
      throw Exception('Error happened in states code ${response.statusCode}');
    }
  }
}
