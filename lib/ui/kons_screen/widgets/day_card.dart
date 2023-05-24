import 'package:flutter/material.dart';

import '../../../entities/slot.dart';
import '../../common/utils.dart';
import '../../navigation/route_name.dart';
import '../../theme/app_color.dart';
import '../../../dummy/current_kons.dart';

class DayCard extends StatelessWidget {
  final List<Slot> slotToday;
  final String date;
  const DayCard({super.key, required this.slotToday, required this.date});

  // final List<String> slotTodayDummy =
  //     List.generate(5, (index) => '1$index:00-1${index + 1}:00');

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('${getWeekDay(getDateFromString(date).weekday)},'),
          RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: [
                TextSpan(
                    text: getDateFromString(date).day.toString(),
                    style: TextStyle(fontSize: 24)),
                TextSpan(
                    text: ' ${getMonthName(getDateFromString(date).month)}'),
              ],
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Center(
                child: SizedBox(
                  width: 250,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TimeView(slot: slotToday[index * 2]),
                      const SizedBox(width: 20),
                      if (index * 2 + 1 < slotToday.length)
                        TimeView(slot: slotToday[index * 2 + 1]),
                    ],
                  ),
                ),
              ),
            ),
            itemCount: slotToday.length % 2 == 0
                ? slotToday.length ~/ 2
                : (slotToday.length ~/ 2) + 1,
          ),
        ],
      ),
    );
  }
}

class TimeView extends StatelessWidget {
  const TimeView({super.key, required this.slot});

  final Slot slot;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        currentKons.time = slot.time;
        currentKons.date = slot.date;

        Navigator.of(context).pushNamed(AppNavRouteName.selectTheme);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: AppColor.greyLight,
        ),
        child: Text(slot.time),
      ),
    );
  }
}
