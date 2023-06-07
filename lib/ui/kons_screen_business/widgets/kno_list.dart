import 'package:flutter/material.dart';

import '../../../dummy/kno_info.dart';
import 'kno_card.dart';

class KNOListWidget extends StatelessWidget {
  const KNOListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return knosFilter!.isEmpty
        ? Center(child: Text('Ничего не найдено'))
        : ListView.builder(
            itemCount: knosFilter!.length,
            itemBuilder: (context, index) {
              return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: KNOCard(kno: knosFilter![index]));
            });
  }
}
