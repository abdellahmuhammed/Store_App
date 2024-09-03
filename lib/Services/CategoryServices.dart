// ignore_for_file: file_names

import 'dart:developer';
import 'package:store_app/models/ProductsModel.dart';
import 'package:store_app/shared/constant.dart';
import 'package:store_app/helper/Api.dart';

class CategoryServices {
  Future<List<dynamic>> getCategory({required String categoryName}) async {
    List<dynamic> jsonData =
        await Api().get(url: '$baseUrl/products/category/$categoryName');

    List<ProductsModel> categoryList = [];
    for (int i = 0; i < jsonData.length; i++) {
      categoryList.add(ProductsModel.fromJson(jsonData[i]));
    }
    log(categoryList.toString());

    return categoryList;
  }
}
