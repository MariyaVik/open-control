import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../mobX/common/common_state.dart';
import '../../common/utils.dart';
import '../../theme/app_color.dart';

class SelectWeek extends StatelessWidget {
  const SelectWeek({
    super.key,
  });

  Future<void> selectDay(BuildContext context) async {
    DateTime? date = await showRoundedDatePicker(
      context: context,
      initialDate: null,
      // initialDatePickerMode: DatePickerMode.year,
      firstDate: DateTime(DateTime.now().year - 1),
      lastDate: DateTime(DateTime.now().year + 1),
      listDateDisabled: [
        DateTime(2023, 6, 1),
        DateTime(2023, 6, 2),
        DateTime(2023, 6, 3),
        DateTime(2023, 6, 4),
        DateTime(2023, 6, 5),
        DateTime(2023, 6, 6),
        DateTime(2023, 6, 7),
        DateTime(2023, 6, 8),
        DateTime(2023, 6, 9),
        DateTime(2023, 6, 10),
        // DateTime(2023, 6, 11),
      ],
      borderRadius: 16,
      theme: Theme.of(context).copyWith(primaryColor: AppColor.mainColor),
      styleDatePicker: MaterialRoundedDatePickerStyle(
        textStyleDayHeader: const TextStyle(color: Colors.black),
        textStyleDayOnCalendar: const TextStyle(color: AppColor.textMain),
        textStyleYearButton: const TextStyle(color: Colors.white),
        textStyleDayButton: const TextStyle(color: Colors.white, fontSize: 32),
        decorationDateSelected: BoxDecoration(
            color: AppColor.mainColor, borderRadius: BorderRadius.circular(6)),
        textStyleDayOnCalendarSelected: const TextStyle(color: Colors.white),
        textStyleDayOnCalendarDisabled:
            const TextStyle(color: AppColor.greyMedium),
      ),
      locale: const Locale("ru", "RU"),
    );

    if (date != null) {
      print(
          'старые даты ${Provider.of<CommonState>(context, listen: false).dates}');

      Provider.of<CommonState>(context, listen: false).getCurrentWeek(date);

      print(
          'новые даты ${Provider.of<CommonState>(context, listen: false).dates}');

      Provider.of<CommonState>(context, listen: false).checkNextDates();
      Provider.of<CommonState>(context, listen: false).checkPrevDates();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return ColoredBox(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
                onPressed: Provider.of<CommonState>(context, listen: false)
                        .hasPrevDates
                    ? () {
                        var dayCurWeekString =
                            Provider.of<CommonState>(context, listen: false)
                                .dates
                                .last;
                        var d = dayCurWeekString
                            .split('-')
                            .map((e) => int.parse(e))
                            .toList();
                        DateTime dayCurWeek = DateTime(d[0], d[1], d[2]);

                        var dayPrevWeek =
                            dayCurWeek.add(const Duration(days: -7));

                        Provider.of<CommonState>(context, listen: false)
                            .getCurrentWeek(dayPrevWeek);
                        Provider.of<CommonState>(context, listen: false)
                            .checkPrevDates();
                        Provider.of<CommonState>(context, listen: false)
                            .checkNextDates();
                      }
                    : null,
                icon: const Icon(Icons.arrow_back_ios_sharp)),
            IconButton(
                onPressed: Provider.of<CommonState>(context, listen: false)
                        .hasNextDates
                    ? () {
                        var dayCurWeekString =
                            Provider.of<CommonState>(context, listen: false)
                                .dates
                                .last;
                        var d = dayCurWeekString
                            .split('-')
                            .map((e) => int.parse(e))
                            .toList();
                        DateTime dayCurWeek = DateTime(d[0], d[1], d[2]);

                        var dayNextWeek =
                            dayCurWeek.add(const Duration(days: 7));
                        Provider.of<CommonState>(context, listen: false)
                            .getCurrentWeek(dayNextWeek);
                        Provider.of<CommonState>(context, listen: false)
                            .checkNextDates();
                        Provider.of<CommonState>(context, listen: false)
                            .checkPrevDates();
                      }
                    : null,
                icon: const Icon(Icons.arrow_forward_ios_sharp)),
            GestureDetector(
              onTap: () {
                selectDay(context);
              },
              child: Text(
                  '${getDateFromString(Provider.of<CommonState>(context, listen: false).dates.first).day.toString()} ${getMonthName(getDateFromString(Provider.of<CommonState>(context, listen: false).dates.first).month)} - ${getDateFromString(Provider.of<CommonState>(context, listen: false).dates.last).day.toString()} ${getMonthName(getDateFromString(Provider.of<CommonState>(context, listen: false).dates.last).month)}',
                  style: Theme.of(context).textTheme.headlineLarge),
            ),
            IconButton(
                onPressed: () {
                  selectDay(context);
                },
                icon: const Icon(Icons.arrow_drop_down))
          ],
        ),
      );
    });
  }
}


// onTap: () => 
// showRoundedDatePicker(
            //   context: context,
            //   initialDate: DateTime.now(),
            //   firstDate: DateTime(DateTime.now().year - 1),
            //   lastDate: DateTime(DateTime.now().year + 1),
            //   borderRadius: 16,
            //   theme:
            //       Theme.of(context).copyWith(primaryColor: AppColor.mainColor),
            //   styleDatePicker: MaterialRoundedDatePickerStyle(
            //     textStyleDayHeader: TextStyle(color: Colors.black),
            //     textStyleDayOnCalendar: TextStyle(color: AppColor.textMain),
            //     textStyleYearButton: TextStyle(color: Colors.white),
            //     textStyleDayButton:
            //         TextStyle(color: Colors.white, fontSize: 32),
            //     decorationDateSelected: BoxDecoration(
            //         color: AppColor.mainColor,
            //         borderRadius: BorderRadius.circular(6)),
            //     textStyleDayOnCalendarSelected: TextStyle(color: Colors.white),
            //   ),
            //   locale: const Locale("ru", "RU"),
            // ),