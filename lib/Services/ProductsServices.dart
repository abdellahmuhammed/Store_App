// ignore_for_file: file_names

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:store_app/constant.dart';
import 'package:store_app/models/products.dart';

class ProductsServices {
  final Dio _dio = Dio();

  Future<List<dynamic>> getAllProducts() async {
    try {
      var response = await _dio.get('$baseUrl/products');

      List<dynamic> jonsData = response.data;

      List<ProductsModel> productsList = [];

      for (int i = 0; i < jonsData.length; i++) {
        productsList.add(ProductsModel.fromJson(jonsData[i]));
      }
      log(productsList.toString());
      return productsList;
    } on DioException catch (error) {
      // لو في مشاكل من ال dio

      throw Exception(
          'Error happened while getting Api from Server, Error Exception : ${error.toString()}');
    } catch (error) {
      // لو في مشاكل اخري غير ال dio
      throw Exception(
          'oops There was an error pleas retry later ${error.toString()}');
    }
  }
}
