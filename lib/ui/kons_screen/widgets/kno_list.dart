import 'package:flutter/material.dart';
import 'package:open_control/entities/kno.dart';

import 'kno_card.dart';

class KNOListWidget extends StatelessWidget {
  final ScrollController controller;
  const KNOListWidget({required this.controller, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 20,
        itemBuilder: (context, index) {
          print(' рисуем карточку события');

          return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: GestureDetector(
                onTap: () {
                  // Navigator.of(context).pushNamed(AppNavRouteName.eventDetails,
                  //     arguments: placesProvider.places[index]);
                },
                child: KNOCard(
                  kno: NadzorOrgans(
                      id: 21,
                      name: 'Главное архивное управление города Москвы',
                      controlTypes: []),
                  // place: placesProvider.places[index],
                ),
              ));
        });
  }
}
