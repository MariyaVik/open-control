import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../../mobX/common/common_state.dart';
import 'kno_card.dart';

class KNOListWidget extends StatelessWidget {
  const KNOListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      if (Provider.of<CommonState>(context).knosFilter!.isEmpty) {
        return const Center(child: Text('Ничего не найдено'));
      }
      return ListView.builder(
          itemCount: Provider.of<CommonState>(context).knosFilter!.length,
          itemBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: KNOCard(
                    kno: Provider.of<CommonState>(context).knosFilter![index]));
          });
    });
  }
}
