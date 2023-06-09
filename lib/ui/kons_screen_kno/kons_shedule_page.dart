import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../entities/slot.dart';
import '../../mobX/common/common_state.dart';
import '../kons_screen_business/widgets/day_card.dart';
import '../kons_screen_business/widgets/select_week.dart';

class KonsShedulePage extends StatefulWidget {
  const KonsShedulePage({super.key});

  @override
  State<KonsShedulePage> createState() => _KonsShedulePageState();
}

class _KonsShedulePageState extends State<KonsShedulePage> {
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
    return Observer(builder: (context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SelectWeek(),
          !state.hasSlots
              ? const Center(child: CircularProgressIndicator())
              : Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    child: RefreshIndicator(
                      onRefresh: () {
                        return Provider.of<CommonState>(context, listen: false)
                            .getSlots();
                      },
                      child: ListView.builder(
                          itemCount: state.allSlots.length,
                          itemBuilder: (contex, index) {
                            List<Slot> slotToday = [];
                            var today = state.allSlots[state.dates[index]]!;
                            for (var e in today) {
                              Slot slot = Slot.fromJson(e);
                              slotToday.add(slot);
                            }

                            return DayCard(
                                slotToday: slotToday,
                                date: state.dates[index],
                                isBusiness: false);
                          }),
                    ),
                  ),
                ),
        ],
      );
    });
  }
}
