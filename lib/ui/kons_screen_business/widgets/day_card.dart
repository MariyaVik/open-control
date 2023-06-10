import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../entities/slot.dart';
import '../../../mobX/common/common_state.dart';
import '../../common/size_config.dart';
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
    SizeConfig().init(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('${getWeekDay(getDateFromString(date).weekday)},'),
        Text(
            '${getDateFromString(date).day.toString()} ${getMonthName(getDateFromString(date).month)}'),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                    width: SizeConfig.screenWidth * 1.8 / 5,
                    child: TimeView(slot: slotForShow[index * 2])),
                if (index * 2 + 1 < slotForShow.length)
                  const SizedBox(width: 20),
                if (index * 2 + 1 < slotForShow.length)
                  SizedBox(
                      width: SizeConfig.screenWidth * 1.8 / 5,
                      child: TimeView(slot: slotForShow[index * 2 + 1]))
                // else
                //   const Expanded(child: SizedBox()),
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
      if (slot.consultation != null) {
        Navigator.of(context).pushNamed(AppNavRouteName.konsDetailsKNO,
            arguments: slot.consultation);
      }
    }

    return InkWell(
      onTap: Provider.of<CommonState>(context).user.isKno == true
          ? actionForKNO
          : actionForBusiness,
      child: slot.consultation != null && !slot.consultation!.isConfirmed!
          ? waitingConfirm(slot)
          : slot.consultation != null &&
                  isTimeBegin(
                      slot.consultation!.date!, slot.consultation!.time!)
              ? timeToCons(slot)
              : slot.consultation != null && slot.consultation!.isConfirmed!
                  ? confirmCons(slot)
                  : freeSlot(slot),
    );
  }

  Widget timeToCons(Slot slot) => Ink(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(color: AppColor.greyMegaLight),
          borderRadius: BorderRadius.circular(5),
          color: AppColor.mainColor,
        ),
        child: Text(
          slot.time,
          style: const TextStyle(color: Colors.white),
        ),
      );

  Widget waitingConfirm(Slot slot) => Ink(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(color: AppColor.greyMegaLight),
          borderRadius: BorderRadius.circular(5),
          color: AppColor.greyMegaLight,
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                slot.time,
              ),
            ),
            const Icon(Icons.access_time_filled_rounded,
                color: AppColor.warning)
          ],
        ),
      );

  Widget confirmCons(Slot slot) => Ink(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(color: AppColor.greyMegaLight),
          borderRadius: BorderRadius.circular(5),
          color: AppColor.greyMegaLight,
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                slot.time,
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: AppColor.access),
              child: const Icon(Icons.done, color: Colors.white),
            )
          ],
        ),
      );

  Widget freeSlot(Slot slot) => Ink(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(color: AppColor.greyMegaLight),
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
        child: Text(
          slot.time,
        ),
      );
}




// slot.consultation != null && !slot.consultation!.isConfirmed!
//           ? AppColor.warning
//           : slot.consultation != null &&
//                   isTimeBegin(
//                       slot.consultation!.date!, slot.consultation!.time!)
//               ? AppColor.mainColor
//               : slot.consultation != null && slot.consultation!.isConfirmed!
//                   ? AppColor.access
//                   : AppColor.whiteColor