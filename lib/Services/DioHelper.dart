// // ignore_for_file: file_names, avoid_print
//
// import 'dart:developer';
//
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:store_app/shared/constant.dart';
//
// class DioHelper {
//   Future<List<dynamic>> get(
//       {required String url, Object? data, @required String? token}) async {
//     Map<String, dynamic>? headers = {};
//     if (token != null) {
//       headers.addAll({
//         'Authorization': 'Bearer $token',
//       });
//     }
//     Response response =
//         await dio.get(url, data: data, queryParameters: headers);
//     if (response.statusCode == 200) {
//       List<dynamic> jsonData = response.data;
//       log('url= $url \n Date = $data \n token = $token');
//       return jsonData;
//     } else {
//       throw Exception(
//           'there is problem with states code ${response.statusCode}');
//     }
//   }
//
//   Future<dynamic> post({
//     required String url,
//     @required dynamic data,
//     @required String? token,
//   }) async {
//     Map<String, String>? headers = {
//       'Content-Type': 'application/x-www-form-urlencoded',
//       'Accept': 'application/json'
//     };
//     if (token != null) {
//       headers.addAll({
//         'Authorization': 'Bearer $token',
//       });
//     }
//     log('url= $url \n Date = $data \n token = $token');
//     Response response =
//         await dio.post(url, data: data, queryParameters: headers);
//
//     if (response.statusCode == 200) {
//       Map<String, dynamic> jsonData = response.data;
//       return jsonData;
//     } else {
//       throw Exception(
//           'there is problem with states code ${response.statusCode} with Data ${response.data}');
//     }
//   }
//
//   Future<dynamic> update({
//     required String url,
//     @required dynamic data,
//     @required String? token,
//   }) async {
//     Map<String, String>? headers = {};
//     headers.addAll({
//       'Content-Type': 'application/x-www-form-urlencoded',
//     });
//     if (token != null) {
//       headers.addAll({
//         'Authorization': 'Bearer $token',
//       });
//     }
//     Response response =
//         await dio.put(url, data: data, queryParameters: headers);
//     print('url = $url Data = $data , Token=$token ');
//
//     if (response.statusCode == 200) {
//       Map<String, dynamic> jsonData = response.data;
//       return jsonData;
//     } else {
//       throw Exception(
//           'there is problem with states code ${response.statusCode} with Data ${response.data}');
//     }
//   }
// }
// ignore_for_file: file_names, avoid_print

import 'dart:developer';
import 'package:dio/dio.dart';

class DioHelper {
  final Dio dio = Dio();

  // this function to GET Request
  Future<List<dynamic>> get({
    required String url,
    Object? data,
    String? token,
  }) async {
    try {
      final headers = _createHeaders(token: token);
      final response = await dio.get(url, data: data, queryParameters: headers);

      if (response.statusCode == 200) {
        // in this case get Request do not Return  data or token, data her i well send.
        log('GET Request:\nURL: $url\nData: $data\nToken: $token');
        return response.data as List<dynamic>;
      } else {
        throw Exception(
            'Error: Status code ${response.statusCode}, Message: ${response.statusMessage}');
      }
    } catch (error) {
      throw Exception('oops error happened and error in ${error.toString()}');
    }
  }

  // this function to add Request  => POST Request

  Future<dynamic> post({
    required String url,
    required dynamic data,
    String? token,
  }) async {
    try {
      final headers = _createHeaders(token: token);
      log('POST Request:\nURL: $url\nData: $data\nToken: $token');
      final response =
          await dio.post(url, data: data, queryParameters: headers);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception(
            'Error: Status code ${response.statusCode}, Message: ${response.statusMessage}');
      }
    } catch (error) {
      throw Exception('oops error happened and error in ${error.toString()}');
    }
  }

  // this function to Edit Request => PUT Request

  Future<dynamic> update({
    required String url,
    required dynamic data,
    String? token,
  }) async {
    try {
      final headers = _createHeaders(
        token: token,
      );
      log('PUT Request:\nURL: $url\nData: $data\nToken: $token');
      final response = await dio.put(url, data: data, queryParameters: headers);

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception(
            'Error: Status code ${response.statusCode}, Message: ${response.statusMessage}');
      }
    } catch (error) {
      rethrow;
    }
  }

  Map<String, String> _createHeaders({String? token}) {
    final headers = <String, String>{};

    headers.addAll({
      'Content-Type': 'application/x-www-form-urlencoded',
      'Accept': 'application/json',
    });

    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    return headers;
  }
}
