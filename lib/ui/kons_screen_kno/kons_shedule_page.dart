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
  void didChangeDependencies() async {
    super.didChangeDependencies();
    state = Provider.of<CommonState>(context);
    state.getSlots();
    if (Provider.of<CommonState>(context, listen: false).knos == null) {
      await Provider.of<CommonState>(context, listen: false).getKNOs();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
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
    });
  }
}

class NarrowSlots extends StatelessWidget {
  const NarrowSlots({super.key});

  @override
  Widget build(BuildContext context) {
    final CommonState state = Provider.of<CommonState>(context);
    return Observer(builder: (context) {
      return ListView.builder(
          itemCount: state.dates.length,
          itemBuilder: (contex, index) {
            List<Slot> slotToday = [];
            var today = state.allSlots[state.dates[index]]!;
            for (var e in today) {
              Slot slot = Slot.fromJson(e);
              slotToday.add(slot);
            }

            return DayCard(
                width: MediaQuery.of(context).size.width,
                slotToday: slotToday,
                date: state.dates[index],
                isBusiness: false);
          });
    });
  }
}

class WideSlots extends StatelessWidget {
  final double width;
  const WideSlots({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    final CommonState state = Provider.of<CommonState>(context);
    return Observer(builder: (context) {
      return ListView.builder(
        itemBuilder: (context, index) {
          List<Slot> slotToday = [];
          var today = state.allSlots[state.dates[index * 2]]!;
          for (var e in today) {
            Slot slot = Slot.fromJson(e);
            slotToday.add(slot);
          }
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DayCard(
                      width: width,
                      slotToday: slotToday,
                      date: state.dates[index * 2],
                      isBusiness: false),
                  const SizedBox(width: 20),
                  index * 2 + 1 < state.dates.length
                      ? DayCard(
                          width: width,
                          slotToday: slotToday,
                          date: state.dates[index * 2 + 1],
                          isBusiness: false)
                      : Expanded(child: SizedBox()),
                ],
              ),
            ),
          );
        },
        itemCount: state.dates.length ~/ 2 + 1 * state.dates.length % 2,
      );
    });
  }
}
