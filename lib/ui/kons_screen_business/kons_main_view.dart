import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:vertical_tabs_flutter/vertical_tabs.dart';

import '../../mobX/common/common_state.dart';
import '../theme/app_color.dart';
import 'widgets/finished_kons.dart';
import 'widgets/no_consultation.dart';
import 'widgets/current_kons.dart';

class KonsMainView extends StatefulWidget {
  const KonsMainView({super.key});

  @override
  State<KonsMainView> createState() => _KonsMainViewState();
}

class _KonsMainViewState extends State<KonsMainView> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Provider.of<CommonState>(context, listen: false).getAllCons();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth < 700) {
          return Column(
            children: [ConsTabs(), ConsTabsContent()],
          );
        } else {
          return VerticalTabs(
            selectedTabBackgroundColor: AppColor.pinkLight,
            indicatorColor: AppColor.mainColor,

            // tabsWidth: 150,
            tabs: <Tab>[
              Tab(text: 'Активные'),
              Tab(text: 'Архив'),
            ],
            contents: <Widget>[
              Observer(builder: (context) {
                if (Provider.of<CommonState>(context).isLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return Provider.of<CommonState>(context, listen: false)
                          .activeKons
                          .isEmpty
                      ? const NoConsultation()
                      : CurrentKons(
                          kons: Provider.of<CommonState>(context, listen: false)
                              .activeKons);
                }
              }),
              Observer(builder: (context) {
                if (Provider.of<CommonState>(context).isLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return Provider.of<CommonState>(context, listen: false)
                          .finishedKons
                          .isEmpty
                      ? const NoConsultation()
                      : FinishedKons(
                          kons: Provider.of<CommonState>(context, listen: false)
                              .finishedKons);
                }
              }),
            ],
          );
          // return Row(
          //   children: [
          //     RotatedBox(quarterTurns: -1, child: ConsTabs()),
          //     ConsTabsContent()
          //   ],
          // );
        }
      }),
    );
  }
}

class ConsTabsContent extends StatelessWidget {
  const ConsTabsContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: TabBarView(
      children: [
        Observer(builder: (context) {
          if (Provider.of<CommonState>(context).isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Provider.of<CommonState>(context, listen: false)
                    .activeKons
                    .isEmpty
                ? const NoConsultation()
                : CurrentKons(
                    kons: Provider.of<CommonState>(context, listen: false)
                        .activeKons);
          }
        }),
        Observer(builder: (context) {
          if (Provider.of<CommonState>(context).isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Provider.of<CommonState>(context, listen: false)
                    .finishedKons
                    .isEmpty
                ? const NoConsultation()
                : FinishedKons(
                    kons: Provider.of<CommonState>(context, listen: false)
                        .finishedKons);
          }
        }),
      ],
    ));
  }
}

class ConsTabs extends StatelessWidget {
  const ConsTabs({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      height: 45,
      decoration: BoxDecoration(
          color: AppColor.greyLight, borderRadius: BorderRadius.circular(5.0)),
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
    );
  }
}
