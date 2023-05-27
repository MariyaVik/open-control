import 'package:flutter/material.dart';
import 'package:open_control/ui/navigation/route_name.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../dummy/current_user.dart';
import '../../entities/all_consultations.dart';
import '../../services/business_api.dart';
import '../theme/app_color.dart';
import 'widgets/user_kons.dart';

class NoBids extends StatelessWidget {
  const NoBids({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/images/bust.png'),
          const SizedBox(height: 20),
          Text(
            'Консультаций пока нет',
            style: Theme.of(context).textTheme.headlineLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 14),
          Text(
            'Задайте свой вопрос в чате или запишитесь на консультацию с контрольными органами',
            style: Theme.of(context).textTheme.labelSmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {
                // Provider.of<CommonState>(context, listen: false).updateTab(0);
                Navigator.of(context)
                    .pushNamed(AppNavRouteName.listKnoBusiness);
              },
              child: const Text('Запись на консультацию'))
        ],
      ),
    ));
  }
}

class KonsMainView extends StatelessWidget {
  const KonsMainView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          Container(
            height: 45,
            decoration: BoxDecoration(
                color: AppColor.greyLight,
                borderRadius: BorderRadius.circular(5.0)),
            child: TabBar(
              indicator: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 5),
                        blurRadius: 5,
                        color: Colors.black.withOpacity(0.25))
                  ],
                  color: AppColor.greyMegaLight,
                  borderRadius: BorderRadius.circular(5.0)),
              labelColor: Colors.black,
              labelStyle:
                  Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 12),
              // unselectedLabelColor: Colors.black,
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
                            ? const NoBids()
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
                            ? const NoBids()
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
