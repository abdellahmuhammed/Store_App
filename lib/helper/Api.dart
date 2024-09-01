import 'package:dio/dio.dart';
import 'package:store_app/constant.dart';

class Api {
Future <List<dynamic>>  get({required String url}) async {
   Response  response = await dio.get(url);
   
    if (response.statusCode == 200) {
       List<dynamic> list = response.data;
      return list;
    } else {
      throw Exception(
          'there is problem with states code ${response.statusCode}');
    }
  }
}
