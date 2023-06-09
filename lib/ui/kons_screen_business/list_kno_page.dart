import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../mobX/common/common_state.dart';
import '../common/app_bar_back.dart';
import '../common/utils.dart';
import 'widgets/kno_list.dart';
import 'widgets/select_entities.dart';

class ListKnoPage extends StatefulWidget {
  const ListKnoPage({super.key});

  @override
  State<ListKnoPage> createState() => _ListKnoPageState();
}

class _ListKnoPageState extends State<ListKnoPage> {
  final controller = TextEditingController();
  late CommonState state;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    state = Provider.of<CommonState>(context);
    if (state.knos == null) {
      state.getKNOs();
    } else {
      state.knosFilter = state.knos;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarBack(context),
        body: Observer(builder: (context) {
          if (state.knosFilter == null) {
            return const Center(child: CircularProgressIndicator());
          }
          return Column(
            children: [
              const SelectEntityWidget(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: TextField(
                  controller: controller,
                  textInputAction: TextInputAction.search,
                  onSubmitted: state.filteringKNO,
                  decoration: InputDecoration(
                    hintText: 'Поиск по ключевым словам',
                    prefixIcon: IconButton(
                        onPressed: () {
                          state.filteringKNO(controller.text);
                        },
                        icon: const Icon(Icons.search)),
                    suffixIcon: controller.text == ''
                        ? null
                        : IconButton(
                            onPressed: () {
                              controller.clear();
                              state.filteringKNO('');
                            },
                            icon: const Icon(Icons.close)),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: Row(children: [
                  Image.asset('assets/images/gerb.png'),
                  const SizedBox(width: 16),
                  Text(
                      '${state.knosFilter!.length} ${getWordOrg(state.knosFilter!.length, 'орган', 'органа', 'органов')} контроля')
                ]),
              ),
              const Expanded(
                child: KNOListWidget(),
              )
            ],
          );
        }));
  }
}
