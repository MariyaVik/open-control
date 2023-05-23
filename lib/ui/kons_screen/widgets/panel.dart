import 'package:flutter/material.dart';

import '../../theme/app_color.dart';
import 'kno_list.dart';

class PanelWidget extends StatelessWidget {
  final ScrollController sc;
  const PanelWidget({required this.sc, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: sc,
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
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: TextField(
            decoration: InputDecoration(hintText: 'Поиск по ключевым словам'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Row(children: [
            Image.asset('assets/images/gerb.png'),
            SizedBox(width: 16),
            Text('56 органов контроля')
          ]),
        ),
        Expanded(
          child: KNOListWidget(controller: sc),
        )
      ],
    );
  }
}
