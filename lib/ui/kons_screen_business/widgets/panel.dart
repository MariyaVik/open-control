import 'package:flutter/material.dart';

import '../../../dummy/current_user.dart';
import '../../../dummy/kno_info.dart';
import '../../../entities/info.dart';
import '../../../entities/kno.dart';
import '../../../services/business_api.dart';
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
    if (knos.isEmpty) {
      print('пусто');
      getData();
    }
  }

  Future<void> getData() async {
    final Info info = await BusinessAPI.instance.getKnoInfo(user.token!);
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
