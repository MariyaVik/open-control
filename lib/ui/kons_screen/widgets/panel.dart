import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../dummy/kno_info.dart';
import '../../../entities/info.dart';
import '../../../entities/kno.dart';
import '../../theme/app_color.dart';
import 'kno_list.dart';

class PanelWidget extends StatefulWidget {
  final ScrollController sc;
  const PanelWidget({required this.sc, super.key});

  @override
  State<PanelWidget> createState() => _PanelWidgetState();
}

class _PanelWidgetState extends State<PanelWidget> {
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
        ));

    print(response.statusCode);
    // print(response.data.toString());
    final Info info = Info.fromJson(response.data);
    print(info);
    knos = info.nadzorOrgans;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      // controller: widget.sc,
      children: [
        Center(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: AppColor.greyLight,
            ),
            height: 8,
            width: 50,
          ),
        ),
        knos.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : Expanded(
                child: Column(
                  children: [
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: 'Поиск по ключевым словам'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 8),
                      child: Row(children: [
                        Image.asset('assets/images/gerb.png'),
                        const SizedBox(width: 16),
                        Text('${knos.length} органов контроля')
                      ]),
                    ),
                    Expanded(
                      child: KNOListWidget(controller: widget.sc),
                    )
                  ],
                ),
              )
      ],
    );
  }
}
