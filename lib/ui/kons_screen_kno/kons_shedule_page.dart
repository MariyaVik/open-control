import 'package:flutter/material.dart';

import '../../dummy/current_user.dart';
import '../../entities/slot.dart';
import '../../services/business_api.dart';
import '../kons_screen_business/widgets/day_card.dart';
import '../kons_screen_business/widgets/select_week.dart';

class KonsShedulePage extends StatefulWidget {
  const KonsShedulePage({super.key});

  @override
  State<KonsShedulePage> createState() => _KonsShedulePageState();
}

class _KonsShedulePageState extends State<KonsShedulePage> {
  List<String> dates = [];
  Map<String, dynamic> allSlots = {};

  @override
  void initState() {
    super.initState();
    getSlots();
  }

  Future<void> getSlots() async {
    allSlots = await BusinessAPI.instance.getSlots(user.token!);
    // await Future.delayed(const Duration(seconds: 2));

    dates = allSlots.keys.toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        SelectWeek(),
        dates.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                child: Expanded(
                  child: ListView.builder(
                      itemCount: allSlots.length,
                      itemBuilder: (contex, index) {
                        List<Slot> slotToday = [];
                        var today = allSlots[dates[index]]!;
                        for (var e in today) {
                          Slot slot = Slot.fromJson(e);
                          slotToday.add(slot);
                        }

                        // print(slotToday[0]);

                        return DayCard(
                            slotToday: slotToday,
                            date: dates[index],
                            isBusiness: false);
                      }),
                ),
              ),
      ],
    );
  }
}
