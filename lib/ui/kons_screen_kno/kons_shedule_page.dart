import 'package:flutter/material.dart';

import '../../entities/slot.dart';
import '../kons_screen_business/widgets/day_card.dart';

class KonsShedulePage extends StatefulWidget {
  const KonsShedulePage({super.key});

  @override
  State<KonsShedulePage> createState() => _KonsShedulePageState();
}

class _KonsShedulePageState extends State<KonsShedulePage> {
  List<String> dates = [];
  Map<String, dynamic> allSlots = {
    "2023-06-07": [
      {
        "id": 36,
        "time": "8:00-9:00",
        "date": "2023-06-07",
        'consultation': null
      },
      {
        "id": 37,
        "time": "9:00-10:00",
        "date": "2023-06-07",
        'consultation': null
      },
      {
        "id": 38,
        "time": "10:00-11:00",
        "date": "2023-06-07",
        'consultation': null
      },
      {
        "id": 39,
        "time": "11:00-12:00",
        "date": "2023-06-07",
        'consultation': {
          "id": 2,
          "nadzor_organ_id": 1,
          "control_type_id": 1,
          "consult_topic_id": 2,
          "slot_id": 39,
          "user_id": 1,
          "time": "11:00",
          "date": "2023-06-07",
          "question": "Вопрос",
          "is_need_letter": true,
          "is_confirmed": true,
          "vks_link": "",
          "video_link": "",
          "is_deleted": false
        }
      },
      {
        "id": 40,
        "time": "12:00-13:00",
        "date": "2023-06-07",
        'consultation': null
      },
      {
        "id": 41,
        "time": "13:00-14:00",
        "date": "2023-06-07",
        'consultation': null
      },
      {
        "id": 42,
        "time": "14:00-15:00",
        "date": "2023-06-07",
        'consultation': {
          "id": 2,
          "nadzor_organ_id": 1,
          "control_type_id": 1,
          "consult_topic_id": 2,
          "slot_id": 42,
          "user_id": 1,
          "time": "14:00",
          "date": "2023-06-07",
          "question": "Очень важный вопрос",
          "is_need_letter": true,
          "is_confirmed": true,
          "vks_link": "",
          "video_link": "",
          "is_deleted": false
        }
      },
      {
        "id": 43,
        "time": "15:00-16:00",
        "date": "2023-06-07",
        'consultation': null
      },
      {
        "id": 44,
        "time": "16:00-17:00",
        "date": "2023-06-07",
        'consultation': {
          "id": 2,
          "nadzor_organ_id": 1,
          "control_type_id": 1,
          "consult_topic_id": 2,
          "slot_id": 44,
          "user_id": 1,
          "time": "16:00",
          "date": "2023-06-07",
          "question": "Очень важный вопрос",
          "is_need_letter": true,
          "is_confirmed": true,
          "vks_link": "",
          "video_link": "",
          "is_deleted": false
        }
      },
      {
        "id": 45,
        "time": "17:00-18:00",
        "date": "2023-06-07",
        'consultation': null
      },
      {
        "id": 46,
        "time": "18:00-19:00",
        "date": "2023-06-07",
        'consultation': {
          "id": 2,
          "nadzor_organ_id": 1,
          "control_type_id": 1,
          "consult_topic_id": 2,
          "slot_id": 46,
          "user_id": 1,
          "time": "18:00",
          "date": "2023-06-07",
          "question": "Очень важный вопрос",
          "is_need_letter": true,
          "is_confirmed": false,
          "vks_link": "",
          "video_link": "",
          "is_deleted": false
        }
      },
      {
        "id": 47,
        "time": "19:00-20:00",
        "date": "2023-06-07",
        'consultation': null
      }
    ],
    "2023-06-08": [
      {
        "id": 48,
        "time": "8:00-9:00",
        "date": "2023-06-08",
        'consultation': null
      },
      {
        "id": 49,
        "time": "9:00-10:00",
        "date": "2023-06-08",
        'consultation': null
      },
      {
        "id": 50,
        "time": "10:00-11:00",
        "date": "2023-06-08",
        'consultation': null
      },
      {
        "id": 51,
        "time": "11:00-12:00",
        "date": "2023-06-08",
        'consultation': null
      },
      {
        "id": 52,
        "time": "12:00-13:00",
        "date": "2023-06-08",
        'consultation': null
      },
      {
        "id": 53,
        "time": "13:00-14:00",
        "date": "2023-06-08",
        'consultation': null
      },
      {
        "id": 54,
        "time": "14:00-15:00",
        "date": "2023-06-08",
        'consultation': null
      },
      {
        "id": 55,
        "time": "15:00-16:00",
        "date": "2023-06-08",
        'consultation': null
      },
      {
        "id": 56,
        "time": "16:00-17:00",
        "date": "2023-06-08",
        'consultation': null
      },
      {
        "id": 57,
        "time": "17:00-18:00",
        "date": "2023-06-08",
        'consultation': null
      },
      {
        "id": 58,
        "time": "18:00-19:00",
        "date": "2023-06-08",
        'consultation': null
      },
      {
        "id": 59,
        "time": "19:00-20:00",
        "date": "2023-06-08",
        'consultation': null
      }
    ],
  };
  // Map<String, dynamic> allSlots = {};

  @override
  void initState() {
    super.initState();
    getSlots();
  }

  Future<void> getSlots() async {
    // allSlots = await BusinessAPI.instance.getSlots(businessUser.token!);
    await Future.delayed(const Duration(seconds: 2));

    dates = allSlots.keys.toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            IconButton(
                onPressed: () {}, icon: Icon(Icons.arrow_back_ios_sharp)),
            IconButton(
                onPressed: () {}, icon: Icon(Icons.arrow_forward_ios_sharp)),
          ],
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
                          slotToday: slotToday,
                          date: dates[index],
                          isBusiness: false);
                    }),
              ),
      ],
    );
  }
}
