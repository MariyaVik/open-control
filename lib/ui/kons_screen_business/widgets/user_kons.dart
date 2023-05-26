import 'package:flutter/material.dart';
import 'package:open_control/entities/consultation.dart';

import '../../../dummy/current_user.dart';
import '../../../entities/all_consultations.dart';
import '../../../services/business_api.dart';
import '../../common/size_config.dart';
import '../../common/utils.dart';
import '../../theme/app_color.dart';
import 'about_kons_card.dart';

class UserKons extends StatelessWidget {
  const UserKons({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<AllConsultations>(
        future: BusinessAPI.instance.getConsultations(user.token!),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return const Center(
                child: Text('NONE'),
              );
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              return snapshot.data!.activeKons.isEmpty
                  ? const CurrentKons()
                  : CurrentKons(kons: snapshot.data!.activeKons);
            default:
              return const Center(
                child: Text('Default'),
              );
          }
        });
  }
}

class CurrentKons extends StatelessWidget {
  final List<Consultation>? kons;
  const CurrentKons({super.key, this.kons});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: EdgeInsets.only(bottom: SizeConfig.screenHeight * 0.36),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            kons == null
                ? const Padding(
                    padding: EdgeInsets.only(right: 20), child: HintWithBot())
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ListView.builder(
                      // physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: kons!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return AboutKonsCard(consultation: kons![index]);
                      },
                    ),
                  ),
            const SizedBox(height: 12),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: AppColor.greyMedium,
                  borderRadius: BorderRadius.circular(5)),
              height: 234,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
              child: kons == null
                  ? const Text('Нет ожидаемой консультации')
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(timeBeforeConsultation(
                            getDateTime(kons!.first.date!, kons!.first.time!))),
                        TextButton(
                            onPressed: () {},
                            child: const Text('Отменить консультацию'))
                      ],
                    ),
            )
          ],
        ),
      ),
    );
  }
}

class HintWithBot extends StatelessWidget {
  const HintWithBot({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset('assets/images/bot.png'),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
                color: AppColor.greyMegaLight,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10))),
            child: const Text(
                'Задайте свой вопрос в чате, или проконсультируйтесь со специалистом.'),
          ),
        )
      ],
    );
  }
}
