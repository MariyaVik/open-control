import 'package:flutter/material.dart';

import '../../../dummy/kno_info.dart';
import '../../../entities/kno.dart';
import 'kno_card.dart';

class KNOListWidget extends StatelessWidget {
  final ScrollController controller;
  const KNOListWidget({required this.controller, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        controller: controller,
        // physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: knos.length,
        itemBuilder: (context, index) {
          return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: GestureDetector(
                onTap: () {
                  // Navigator.of(context).pushNamed(AppNavRouteName.eventDetails,
                  //     arguments: placesProvider.places[index]);
                },
                child: KNOCard(
                  kno: knos[index],
                ),
              ));
        });
  }
}
