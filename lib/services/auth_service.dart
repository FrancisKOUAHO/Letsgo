import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:letsgo/config/base_url.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthService {
  Dio dio = Dio();

  signIn(email, password) async {
    try {
      dynamic data = {"email": email, "password": password};

      var response = await dio.post(BaseUrl.URL + "/session",
          data: data,
          options: Options(headers: {
            'content-type': 'application/json; charset=UTF-8',
          }));

      return response.data;
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: e.response?.data['message'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP_RIGHT,
          backgroundColor: Colors.red,
          fontSize: 16.0);
    }
  }

  signUp(name, email, password) async {
    try {
      return await dio.post(BaseUrl.URL + "/users",
          data: {"name": name, "email": email, "password": password},
          options: Options(contentType: Headers.formUrlEncodedContentType));
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: e.response?.data['message'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP_RIGHT,
          backgroundColor: Colors.red,
          fontSize: 16.0);
    }
  }
}
