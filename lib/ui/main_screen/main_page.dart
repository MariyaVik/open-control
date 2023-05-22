import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    var dio = Dio();
    String token =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJlbWFpbCI6InVzZXJAZXhhbXBsZS5jb20iLCJuYW1lIjoiVXNlck5hbWUiLCJleHAiOjE2ODczNzMxNzV9.sQ4BXFcyiDGtBHq4eUvSWdS7tQEF74ngIPZv0KguknE';
    dio.options.headers["Authorization"] = "Bearer $token";
    var response = await dio.get('http://hack.torbeno.ru/api/v1/typelist',
        options: Options(
          contentType: 'application/x-www-form-urlencoded',
        ),
        data: {'login': 'user', 'password': '123321'});

    print(response.statusCode);
    print(response.data.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
