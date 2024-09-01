// ignore_for_file: file_names

import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:store_app/constant.dart';

class AllCategoriesServices {
  Future<List<dynamic>> getAllCategories() async {
   
  Response response = await dio.get('$baseUrl/products/categories');
   if (response.statusCode==200) {
  List<dynamic> jsonData = response.data;
  log(jsonData.toString());
  return jsonData;
}else {
      throw Exception('there is problem with states code ${response.statusCode}');
    }
  }
}
