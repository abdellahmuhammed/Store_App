// ignore_for_file: file_names

import 'package:store_app/Services/DioHelper.dart';
import 'package:store_app/shared/constant.dart';

class AllCategoriesServices {
  Future<List<dynamic>> getAllCategories() async {
    List<dynamic> jsonData = await DioHelper().get(url: '$baseUrl/products/categories');
      return jsonData;
  }
}
