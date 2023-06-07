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
  final controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    if (knos == null) {
      print('пусто');
      getData();
    } else {
      knosFilter = knos;
    }
  }

  Future<void> getData() async {
    final Info info = await BusinessAPI.instance.getKnoInfo(user.token!);
    print(info);
    knos = info.nadzorOrgans;
    knosFilter = knos;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarBack(context),
      body: knosFilter == null
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                const SelectEntityWidget(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: TextField(
                    controller: controller,
                    textInputAction: TextInputAction.search,
                    onSubmitted: (value) async {
                      print(value);
                      knosFilter = await BusinessAPI.instance
                          .postKno(user.token!, value);
                      setState(() {});
                    },
                    decoration: InputDecoration(
                      hintText: 'Поиск по ключевым словам',
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: Row(children: [
                    Image.asset('assets/images/gerb.png'),
                    const SizedBox(width: 16),
                    Text('${knosFilter!.length} органов контроля')
                  ]),
                ),
                const Expanded(
                  child:
                      KNOListWidget(), //не обновляется :( СДЕЛАЙ STATE MANAGMENT !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                )
              ],
            ),
    );
  }
}
