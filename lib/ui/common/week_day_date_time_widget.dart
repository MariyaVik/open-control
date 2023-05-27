import 'package:flutter/material.dart';

import '../../entities/consultation.dart';
import 'utils.dart';

class WeekDayDateTimeWidget extends StatelessWidget {
  final Consultation consultation;
  const WeekDayDateTimeWidget({super.key, required this.consultation});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                '${getWeekDay(getDateFromString(consultation.date!).weekday)},'),
            RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: [
                  TextSpan(
                    text: getDateFromString(consultation.date!).day.toString(),
                    // style: TextStyle(fontSize: 24),
                  ),
                  TextSpan(
                      text:
                          ' ${getMonthName(getDateFromString(consultation.date!).month)}'),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(width: 16),
        Text(consultation.time!)
      ],
    );
  }
}
