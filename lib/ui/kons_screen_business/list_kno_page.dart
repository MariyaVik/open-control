import 'package:flutter/material.dart';

import '../../dummy/current_user.dart';
import '../../dummy/kno_info.dart';
import '../../entities/info.dart';
import '../../services/business_api.dart';
import '../common/app_bar_back.dart';
import 'widgets/kno_list.dart';
import 'widgets/select_entities.dart';

class ListKnoPage extends StatefulWidget {
  const ListKnoPage({super.key});

  @override
  State<ListKnoPage> createState() => _ListKnoPageState();
}

class _ListKnoPageState extends State<ListKnoPage> {
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
    return Scaffold(
      appBar: appBarBack(context),
      body: knos.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                const SelectEntityWidget(),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: TextField(
                    decoration:
                        InputDecoration(hintText: 'Поиск по ключевым словам'),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: Row(children: [
                    Image.asset('assets/images/gerb.png'),
                    const SizedBox(width: 16),
                    Text('${knos.length} органов контроля')
                  ]),
                ),
                const Expanded(
                  child: KNOListWidget(),
                )
              ],
            ),
    );
  }
}
