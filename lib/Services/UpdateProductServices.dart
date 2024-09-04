// ignore_for_file: file_names, avoid_print


import 'package:store_app/Services/DioHelper.dart';
import 'package:store_app/shared/constant.dart';
import 'package:store_app/models/ProductsModel.dart';

class UpdateProductServices {
  Future<ProductsModel> updateProduct({
    required int id,
    required String title,
    required String price,
    required String description,
    required String image,
    required String category,
  }) async {
    var jsonData = await DioHelper().update(
      url: '$baseUrl/products/$id',
      data: {
        'title': title,
        'price': price,
        'description': description,
        'image': image,
        'category': category,
      },

      token: null,
    );
    return ProductsModel.fromJson(jsonData);
  }
}
