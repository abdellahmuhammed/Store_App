// ignore_for_file: file_names

import 'dart:developer';
import 'package:store_app/constant.dart';
import 'package:store_app/helper/Api.dart';

class AllCategoriesServices {
  Future<List<dynamic>> getAllCategories() async {
    List<dynamic> jsonData = await Api().get(url: '$baseUrl/products/categories');
      log(jsonData.toString());
      return jsonData;
    
  }
}
