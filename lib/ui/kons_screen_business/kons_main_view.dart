import 'package:flutter/material.dart';

import '../../dummy/current_user.dart';
import '../../entities/all_consultations.dart';
import '../../services/business_api.dart';
import '../theme/app_color.dart';
import 'widgets/no_consultation.dart';
import 'widgets/user_kons.dart';

class KonsMainView extends StatelessWidget {
  const KonsMainView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            height: 45,
            decoration: BoxDecoration(
                color: AppColor.greyLight,
                borderRadius: BorderRadius.circular(5.0)),
            child: TabBar(
              indicator: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(0, 5),
                        blurRadius: 5,
                        color: Colors.black.withOpacity(0.25))
                  ],
                  color: AppColor.greyMegaLight,
                  borderRadius: BorderRadius.circular(5.0)),
              labelColor: Colors.black,
              labelStyle:
                  Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 12),
              tabs: const [
                Tab(text: 'Активные'),
                Tab(text: 'Архив'),
              ],
            ),
          ),
          Expanded(
              child: TabBarView(
            children: [
              FutureBuilder<AllConsultations>(
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
                            ? const NoConsultation()
                            : CurrentKons(kons: snapshot.data!.activeKons);
                      default:
                        return const Center(
                          child: Text('Default'),
                        );
                    }
                  }),
              FutureBuilder<AllConsultations>(
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
                        return snapshot.data!.finishedKons.isEmpty
                            ? const NoConsultation()
                            : CurrentKons(kons: snapshot.data!.finishedKons);
                      default:
                        return const Center(
                          child: Text('Default'),
                        );
                    }
                  }),
            ],
          ))
        ],
      ),
    );
  }
}
