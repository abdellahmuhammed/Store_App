// ignore_for_file: file_names

import 'package:store_app/models/ProductsModel.dart';
import 'package:store_app/shared/constant.dart';
import 'DioHelper.dart';

class AllProductsServices {
  Future<List<ProductsModel>> getAllProducts() async {
    List<dynamic> jsonData = await DioHelper().get(url:'$baseUrl/products');
    List<ProductsModel> productsList = [];
    for (int i = 0; i < jsonData.length; i++) {
      productsList.add(ProductsModel.fromJson(jsonData[i]));
    }
    return productsList;
  }
}
