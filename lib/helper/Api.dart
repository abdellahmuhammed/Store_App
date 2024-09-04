// ignore_for_file: file_names, avoid_print

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:store_app/shared/constant.dart';

class Api {
  Future<List<dynamic>> get({required String url}) async {
    Response response = await dio.get(url);

    if (response.statusCode == 200) {
      List<dynamic> jsonData = response.data;
      return jsonData;
    } else {
      throw Exception(
          'there is problem with states code ${response.statusCode}');
    }
  }

  Future<dynamic> post({
    required String url,
    @required dynamic data,
    @required String? token,
  }) async {
    Map<String, String>? headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Accept': 'application/json'
    };
    if (token != null) {
      headers.addAll({
        'Authorization': 'Bearer $token',
      });
    }
    Response response =
        await dio.post(url, data: data, queryParameters: headers);

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = response.data;
      return jsonData;
    } else {
      throw Exception(
          'there is problem with states code ${response.statusCode} with Data ${response.data}');
    }
  }

  Future<dynamic> update({
    required String url,
    @required dynamic data,
    @required String? token,
  }) async {
    Map<String, String>? headers = {};
    headers.addAll({
      'Content-Type': 'application/x-www-form-urlencoded',
      'Accept': 'application/json',
    });
    if (token != null) {
      headers.addAll({
        'Authorization': 'Bearer $token',
      });
    }
    Response response =
        await dio.put(url, data: data, queryParameters: headers);
    print('url = $url Data = $data , Token=$token ');

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = response.data;
    //  print('url = $url Data = $data , Token=$token ');
      log(jsonData.toString());
      return jsonData;
    } else {
      throw Exception(
          'there is problem with states code ${response.statusCode} with Data ${response.data}');
    }
  }
}
