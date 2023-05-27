import 'package:flutter/material.dart';
import 'package:open_control/entities/consultation.dart';
import 'package:open_control/ui/theme/app_color.dart';

import '../../common/size_config.dart';
import '../../navigation/route_name.dart';
import 'about_kons_card.dart';

class CurrentKons extends StatelessWidget {
  final List<Consultation>? kons;
  const CurrentKons({super.key, this.kons});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(AppNavRouteName.listKnoBusiness);
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: AppColor.greyLight,
                  borderRadius: BorderRadius.circular(6)),
              child: Center(
                child: Text(
                  'Создать новую заявку на консультацию',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(color: AppColor.textHigh),
                ),
              ),
            ),
          ),
          const SizedBox(height: 18),
          Center(
            child: Text('Предстоящие консультации',
                style: Theme.of(context).textTheme.headlineLarge),
          ),
          const SizedBox(height: 18),
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: kons!.length,
              itemBuilder: (BuildContext context, int index) {
                return AboutKonsCard(consultation: kons![index]);
              },
              separatorBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Divider(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
