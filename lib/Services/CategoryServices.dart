// ignore_for_file: file_names

import 'package:store_app/Services/DioHelper.dart';
import 'package:store_app/models/ProductsModel.dart';
import 'package:store_app/shared/constant.dart';

class CategoryServices {
  Future<List<dynamic>> getCategory({required String categoryName}) async {
    List<dynamic> jsonData =
        await DioHelper().get(url: '$baseUrl/products/category/$categoryName');
    List<ProductsModel> categoryList = [];
    for (int i = 0; i < jsonData.length; i++) {
      categoryList.add(ProductsModel.fromJson(jsonData[i]));
    }
    return categoryList;
  }
}
