import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:open_control/entities/kno.dart';
import 'package:provider/provider.dart';

import '../../mobX/common/common_state.dart';
import '../common/app_bar_back.dart';
import '../kons_screen_kno/kons_shedule_page.dart';
import 'widgets/select_week.dart';

class SelectDateTimeView extends StatefulWidget {
  final NadzorOrgans kno;
  const SelectDateTimeView({super.key, required this.kno});

  @override
  State<SelectDateTimeView> createState() => _SelectDateTimeViewState();
}

class _SelectDateTimeViewState extends State<SelectDateTimeView> {
  late CommonState state;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    state = Provider.of<CommonState>(context);
    state.getSlots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarBack(context),
      body: Observer(builder: (context) {
        return !state.hasSlots
            ? const Center(child: CircularProgressIndicator())
            : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SelectWeek(),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 12),
                      child: LayoutBuilder(builder: (context, constraints) {
                        return RefreshIndicator(
                          onRefresh: () {
                            return Provider.of<CommonState>(context,
                                    listen: false)
                                .getSlots();
                          },
                          child: constraints.maxWidth < 700
                              ? const NarrowSlots()
                              : WideSlots(width: constraints.maxWidth),
                        );
                      }),
                    ),
                  ),
                ],
              );
      }),
      // body: Observer(builder: (context) {
      //   return Column(
      //     children: [
      //       const SelectWeek(),
      //       state.dates.isEmpty
      //           ? const Center(child: CircularProgressIndicator())
      //           : Expanded(
      //               child: Padding(
      //                 padding: const EdgeInsets.all(20.0),
      //                 child: ListView.builder(
      //                     itemCount: state.allSlots.length,
      //                     itemBuilder: (contex, index) {
      //                       List<Slot> slotToday = [];
      //                       var today = state.allSlots[state.dates[index]]!;
      //                       for (var e in today) {
      //                         Slot slot = Slot.fromJson(e);
      //                         slotToday.add(slot);
      //                       }
      //                       return DayCard(
      //                           slotToday: slotToday, date: state.dates[index]);
      //                     }),
      //               ),
      //             )
      //     ],
      //   );
      // }),
    );
  }
}
