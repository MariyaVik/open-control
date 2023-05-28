import 'package:flutter/material.dart';

import '../../../entities/slot.dart';
import '../../common/utils.dart';
import '../../navigation/route_name.dart';
import '../../theme/app_color.dart';
import '../../../dummy/current_kons.dart';

class DayCard extends StatelessWidget {
  final bool isBusiness;
  final List<Slot> slotToday;
  final String date;
  const DayCard(
      {super.key,
      required this.slotToday,
      required this.date,
      this.isBusiness = true});

  // final List<String> slotTodayDummy =
  //     List.generate(5, (index) => '1$index:00-1${index + 1}:00');

  @override
  Widget build(BuildContext context) {
    List<Slot> slotForShow = isBusiness
        ? slotToday.where((element) => element.consultation == null).toList()
        : slotToday;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('${getWeekDay(getDateFromString(date).weekday)},'),
        Text(
            '${getDateFromString(date).day.toString()} ${getMonthName(getDateFromString(date).month)}'),
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                TimeView(slot: slotForShow[index * 2]),
                const SizedBox(width: 20),
                if (index * 2 + 1 < slotForShow.length)
                  TimeView(slot: slotForShow[index * 2 + 1]),
              ],
            ),
          ),
          itemCount: slotForShow.length % 2 == 0
              ? slotForShow.length ~/ 2
              : (slotForShow.length ~/ 2) + 1,
        ),
      ],
    );
  }
}

class TimeView extends StatelessWidget {
  const TimeView({super.key, required this.slot});

  final Slot slot;

  @override
  Widget build(BuildContext context) {
    void actionForBusiness() {
      currentKons.time = slot.time;
      currentKons.date = slot.date + 'T00:00:00Z';
      currentKons.slotId = slot.id;

      Navigator.of(context).pushNamed(AppNavRouteName.selectThemeBusiness);
    }

    void actionForKNO() {
      Navigator.of(context).pushNamed(AppNavRouteName.konsDetailsKNO,
          arguments: slot.consultation);
    }

    return GestureDetector(
      onTap: slot.consultation != null ? actionForKNO : actionForBusiness,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: slot.consultation != null && !slot.consultation!.isConfirmed!
              ? AppColor.warning
              : slot.consultation != null &&
                      isTimeBegin(
                          slot.consultation!.date!, slot.consultation!.time!)
                  ? AppColor.mainColor
                  : slot.consultation != null && slot.consultation!.isConfirmed!
                      ? AppColor.access
                      : AppColor.greyLight,
        ),
        child: Text(slot.time),
      ),
    );
  }
}
