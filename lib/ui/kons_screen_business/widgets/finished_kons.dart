import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../entities/consultation.dart';
import '../../common/size_config.dart';
import 'about_kons_card.dart';

class FinishedKons extends StatelessWidget {
  final List<Consultation>? kons;
  const FinishedKons({super.key, this.kons});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Text('Дата консультации'),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            inputFormatters: [MaskTextInputFormatter(mask: "##/##/####")],
            decoration: InputDecoration(hintText: 'дд/мм/гггг'),
            keyboardType: TextInputType.number,
          ),
        ),
        const SizedBox(height: 18),
        Center(
          child: Text('Прошедшие консультации',
              style: Theme.of(context).textTheme.headlineLarge),
        ),
        const SizedBox(height: 18),
        Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: kons!.length,
            itemBuilder: (BuildContext context, int index) {
              return AboutFinishedKonsCard(consultation: kons![index]);
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                // child: Divider(),
              );
            },
          ),
        ),
      ],
    );
  }
}
