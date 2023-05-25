import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:open_control/entities/kno.dart';

import '../../dummy/current_user.dart';
import '../../entities/slot.dart';
import '../../services/business_api.dart';
import '../common/close_button.dart';
import 'widgets/day_card.dart';

class SelectDateTimeView extends StatefulWidget {
  final NadzorOrgans kno;
  const SelectDateTimeView({super.key, required this.kno});

  @override
  State<SelectDateTimeView> createState() => _SelectDateTimeViewState();
}

//List<Map<String, dynamic>>
class _SelectDateTimeViewState extends State<SelectDateTimeView> {
  List<String> dates = [];
  // Map<String, dynamic> allSlots = {
  //   "2023-06-07": [
  //     {"id": 36, "time": "8:00-9:00", "date": "2023-06-07"},
  //     {"id": 37, "time": "9:00-10:00", "date": "2023-06-07"},
  //     {"id": 38, "time": "10:00-11:00", "date": "2023-06-07"},
  //     {"id": 39, "time": "11:00-12:00", "date": "2023-06-07"},
  //     {"id": 40, "time": "12:00-13:00", "date": "2023-06-07"},
  //     {"id": 41, "time": "13:00-14:00", "date": "2023-06-07"},
  //     {"id": 42, "time": "14:00-15:00", "date": "2023-06-07"},
  //     {"id": 43, "time": "15:00-16:00", "date": "2023-06-07"},
  //     {"id": 44, "time": "16:00-17:00", "date": "2023-06-07"},
  //     {"id": 45, "time": "17:00-18:00", "date": "2023-06-07"},
  //     {"id": 46, "time": "18:00-19:00", "date": "2023-06-07"},
  //     {"id": 47, "time": "19:00-20:00", "date": "2023-06-07"}
  //   ],
  //   "2023-06-08": [
  //     {"id": 48, "time": "8:00-9:00", "date": "2023-06-08"},
  //     {"id": 49, "time": "9:00-10:00", "date": "2023-06-08"},
  //     {"id": 50, "time": "10:00-11:00", "date": "2023-06-08"},
  //     {"id": 51, "time": "11:00-12:00", "date": "2023-06-08"},
  //     {"id": 52, "time": "12:00-13:00", "date": "2023-06-08"},
  //     {"id": 53, "time": "13:00-14:00", "date": "2023-06-08"},
  //     {"id": 54, "time": "14:00-15:00", "date": "2023-06-08"},
  //     {"id": 55, "time": "15:00-16:00", "date": "2023-06-08"},
  //     {"id": 56, "time": "16:00-17:00", "date": "2023-06-08"},
  //     {"id": 57, "time": "17:00-18:00", "date": "2023-06-08"},
  //     {"id": 58, "time": "18:00-19:00", "date": "2023-06-08"},
  //     {"id": 59, "time": "19:00-20:00", "date": "2023-06-08"}
  //   ],
  // };
  Map<String, dynamic> allSlots = {};

  @override
  void initState() {
    super.initState();
    getSlots().then((value) {
      setState(() {});
    });
  }

  Future<void> getSlots() async {
    allSlots = await BusinessAPI.instance.getSlots(businessUser.token!);

    dates = allSlots.keys.toList();

    // print(dates);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(22.0),
      child: Column(
        children: [
          const Align(alignment: Alignment.topRight, child: CloseButtonMy()),
          Row(
            children: [],
          ),
          dates.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : Expanded(
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
                            slotToday: slotToday, date: dates[index]);
                      }),
                )
        ],
      ),
    );
  }
}



// "2023-06-07": [
//         {
//             "id": 36,
//             "time": "8:00-9:00",
//             "date": "2023-06-07"
//         },
//         {
//             "id": 37,
//             "time": "9:00-10:00",
//             "date": "2023-06-07"
//         },
//         {
//             "id": 38,
//             "time": "10:00-11:00",
//             "date": "2023-06-07"
//         },
//         {
//             "id": 39,
//             "time": "11:00-12:00",
//             "date": "2023-06-07"
//         },
//         {
//             "id": 40,
//             "time": "12:00-13:00",
//             "date": "2023-06-07"
//         },
//         {
//             "id": 41,
//             "time": "13:00-14:00",
//             "date": "2023-06-07"
//         },
//         {
//             "id": 42,
//             "time": "14:00-15:00",
//             "date": "2023-06-07"
//         },
//         {
//             "id": 43,
//             "time": "15:00-16:00",
//             "date": "2023-06-07"
//         },
//         {
//             "id": 44,
//             "time": "16:00-17:00",
//             "date": "2023-06-07"
//         },
//         {
//             "id": 45,
//             "time": "17:00-18:00",
//             "date": "2023-06-07"
//         },
//         {
//             "id": 46,
//             "time": "18:00-19:00",
//             "date": "2023-06-07"
//         },
//         {
//             "id": 47,
//             "time": "19:00-20:00",
//             "date": "2023-06-07"
//         }
//     ],
//     "2023-06-08": [
//         {
//             "id": 48,
//             "time": "8:00-9:00",
//             "date": "2023-06-08"
//         },
//         {
//             "id": 49,
//             "time": "9:00-10:00",
//             "date": "2023-06-08"
//         },
//         {
//             "id": 50,
//             "time": "10:00-11:00",
//             "date": "2023-06-08"
//         },
//         {
//             "id": 51,
//             "time": "11:00-12:00",
//             "date": "2023-06-08"
//         },
//         {
//             "id": 52,
//             "time": "12:00-13:00",
//             "date": "2023-06-08"
//         },
//         {
//             "id": 53,
//             "time": "13:00-14:00",
//             "date": "2023-06-08"
//         },
//         {
//             "id": 54,
//             "time": "14:00-15:00",
//             "date": "2023-06-08"
//         },
//         {
//             "id": 55,
//             "time": "15:00-16:00",
//             "date": "2023-06-08"
//         },
//         {
//             "id": 56,
//             "time": "16:00-17:00",
//             "date": "2023-06-08"
//         },
//         {
//             "id": 57,
//             "time": "17:00-18:00",
//             "date": "2023-06-08"
//         },
//         {
//             "id": 58,
//             "time": "18:00-19:00",
//             "date": "2023-06-08"
//         },
//         {
//             "id": 59,
//             "time": "19:00-20:00",
//             "date": "2023-06-08"
//         }
//     ],