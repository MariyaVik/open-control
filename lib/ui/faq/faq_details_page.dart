import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../entities/faq.dart';
import '../common/app_bar_back.dart';
import '../common/utils.dart';
import '../theme/app_color.dart';
import 'like_count.dart';

class FaqDetailsPage extends StatelessWidget {
  final Faq faq;
  const FaqDetailsPage({super.key, required this.faq});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBarBack(context),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Заголовок',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(height: 16),
                Text(DateFormat('dd.MM.yyyy').format(faq.date),
                    style: Theme.of(context).textTheme.labelSmall),
                const SizedBox(height: 24),
                Text(faq.question),
                const SizedBox(height: 24),
                Text('Контрольно-надзорный орган',
                    style: Theme.of(context).textTheme.labelSmall),
                Text(getKNOById(context, faq.nadzorOrganId).name.toUpperCase()),
                const SizedBox(height: 16),
                Text('Вид контроля',
                    style: Theme.of(context).textTheme.labelSmall),
                Text(getControlTypeById(
                        context, faq.nadzorOrganId, faq.controlTypeId)
                    .name),
                const SizedBox(height: 24),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColor.greyLight),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                  ),
                  child: Text(faq.answer),
                ),
                Text(getKNOById(context, faq.nadzorOrganId).name.toUpperCase(),
                    style: Theme.of(context).textTheme.labelSmall),
                Row(
                  children: [
                    Checkbox(
                      value: false,
                      onChanged: (value) {},
                      fillColor:
                          MaterialStateProperty.all<Color>(AppColor.access),
                    ),
                    const Expanded(
                        child: Text('Я получил ответ на свой вопрос')),
                    LikeCount(faq: faq)
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
