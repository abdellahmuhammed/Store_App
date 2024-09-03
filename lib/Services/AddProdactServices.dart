// ignore_for_file: file_names

import 'dart:developer';

import 'package:store_app/shared/constant.dart';
import 'package:store_app/helper/Api.dart';
import 'package:store_app/models/ProductsModel.dart';

class AddProdactServices {
  Future<ProductsModel> addProduct({
    required String title,
    required String price,
    required String description,
    required String image,
    required String category,
  }) async {
    Map<String, dynamic> response =
        await Api().post(url: '$baseUrl/products', data: {
      'title':title,
      'price':price,
      'description': description,
      'image': image,
      'category': category,
    } , token: null);
    var data = ProductsModel.fromJson(response);
    log(response.toString());
    return data;
  }
}
