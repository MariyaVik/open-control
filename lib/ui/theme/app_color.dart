import 'package:flutter/material.dart';

class AppColor {
  static const Color whiteColor = Colors.white;

  static const Color mainColor = Color(0xFFF64027);
  static const Color mainDark = Color(0xFFE13925);
  static const Color mainLight = Color(0xFFF75D47);

  static const Color textMain = Color(0xFF3C514E);
  static const Color textHigh = Color(0xFF112B27);
  static const Color textLow = Color(0xFF677775);
  static const Color textDisable = Color(0xFFA7B1AF);

  // static const Color greyDark = Color(0xFF717171);
  static const Color greyMedium = Color(0xFFBCC4C3);
  static const Color greyLight = Color(0xFFD2D7D6);
  static const Color greyMegaLight = Color(0xFFE7EAE9);

  static const Color warning = Color(0xFFE07613);
  static const Color access = Color(0xFF198F7E);
  static const Color error = Color(0xFFE62E4D);

  static const Color pinkColor = Color(0xFFFCB8AE);
  static const Color pinkDark = Color(0xFFFA9A8D);
  static const Color pinkLight = Color(0xFFFDD6D0);
  static const Color pinkLighter = Color(0xFFFFF5F2);
}







// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../../../entities/slot.dart';
// import '../../../mobX/common/common_state.dart';
// import '../../common/size_config.dart';
// import '../../common/utils.dart';
// import '../../navigation/route_name.dart';
// import '../../theme/app_color.dart';
// import '../../../dummy/current_kons.dart';

// class DayCard extends StatelessWidget {
//   final bool isBusiness;
//   final List<Slot> slotToday;
//   final String date;
//   const DayCard(
//       {super.key,
//       required this.slotToday,
//       required this.date,
//       this.isBusiness = true});

//   // final List<String> slotTodayDummy =
//   //     List.generate(5, (index) => '1$index:00-1${index + 1}:00');

//   @override
//   Widget build(BuildContext context) {
//     List<Slot> slotForShow = isBusiness
//         ? slotToday.where((element) => element.consultation == null).toList()
//         : slotToday;
//     SizeConfig().init(context);
//     return Expanded(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text('${getWeekDay(getDateFromString(date).weekday)},'),
//           Text(
//               '${getDateFromString(date).day.toString()} ${getMonthName(getDateFromString(date).month)}'),
//           LayoutBuilder(builder: (context, constraints) {
//             return ListView.builder(
//               physics: const NeverScrollableScrollPhysics(),
//               shrinkWrap: true,
//               itemBuilder: (context, index) => Padding(
//                 padding: const EdgeInsets.only(bottom: 8.0),
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     SizedBox(
//                         width: constraints.maxWidth < 600
//                             ? SizeConfig.screenWidth * 1.8 / 5
//                             : SizeConfig.screenWidth * 1.8 / 2.5,
//                         child: TimeView(slot: slotForShow[index * 2])),
//                     if (index * 2 + 1 < slotForShow.length)
//                       const SizedBox(width: 20),
//                     if (index * 2 + 1 < slotForShow.length)
//                       SizedBox(
//                           width: constraints.maxWidth < 600
//                               ? SizeConfig.screenWidth * 1.8 / 5
//                               : SizeConfig.screenWidth * 1.8 / 2.5,
//                           child: TimeView(slot: slotForShow[index * 2 + 1]))
//                     // else
//                     //   const Expanded(child: SizedBox()),
//                   ],
//                 ),
//               ),
//               itemCount: slotForShow.length % 2 == 0
//                   ? slotForShow.length ~/ 2
//                   : (slotForShow.length ~/ 2) + 1,
//             );
//           }),
//         ],
//       ),
//     );
//   }
// }

// class TimeView extends StatelessWidget {
//   const TimeView({super.key, required this.slot});

//   final Slot slot;

//   @override
//   Widget build(BuildContext context) {
//     void actionForBusiness() {
//       currentKons.time = slot.time;
//       currentKons.date = slot.date + 'T00:00:00Z';
//       currentKons.slotId = slot.id;

//       Navigator.of(context).pushNamed(AppNavRouteName.selectThemeBusiness);
//     }

//     void actionForKNO() {
//       if (slot.consultation != null) {
//         Navigator.of(context).pushNamed(AppNavRouteName.konsDetailsKNO,
//             arguments: slot.consultation);
//       }
//     }

//     return GestureDetector(
//       onTap: Provider.of<CommonState>(context).user.isKno == true
//           ? actionForKNO
//           : actionForBusiness,
//       child: slot.consultation != null && !slot.consultation!.isConfirmed!
//           ? waitingConfirm(slot)
//           : slot.consultation != null &&
//                   isTimeBegin(
//                       slot.consultation!.date!, slot.consultation!.time!)
//               ? timeToCons(slot)
//               : slot.consultation != null && slot.consultation!.isConfirmed!
//                   ? confirmCons(slot)
//                   : freeSlot(slot),
//     );
//   }

//   Widget timeToCons(Slot slot) => Container(
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//         decoration: BoxDecoration(
//           border: Border.all(color: AppColor.greyMegaLight),
//           borderRadius: BorderRadius.circular(5),
//           color: AppColor.mainColor,
//         ),
//         child: Text(
//           slot.time,
//           style: const TextStyle(color: Colors.white),
//         ),
//       );

//   Widget waitingConfirm(Slot slot) => Container(
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//         decoration: BoxDecoration(
//           border: Border.all(color: AppColor.greyMegaLight),
//           borderRadius: BorderRadius.circular(5),
//           color: AppColor.greyMegaLight,
//         ),
//         child: Row(
//           children: [
//             Expanded(
//               child: Text(
//                 slot.time,
//               ),
//             ),
//             const Icon(Icons.access_time_filled_rounded,
//                 color: AppColor.warning)
//           ],
//         ),
//       );

//   Widget confirmCons(Slot slot) => Container(
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//         decoration: BoxDecoration(
//           border: Border.all(color: AppColor.greyMegaLight),
//           borderRadius: BorderRadius.circular(5),
//           color: AppColor.greyMegaLight,
//         ),
//         child: Row(
//           children: [
//             Expanded(
//               child: Text(
//                 slot.time,
//               ),
//             ),
//             Container(
//               decoration: const BoxDecoration(
//                   shape: BoxShape.circle, color: AppColor.access),
//               child: const Icon(Icons.done, color: Colors.white),
//             )
//           ],
//         ),
//       );

//   Widget freeSlot(Slot slot) => Container(
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//         decoration: BoxDecoration(
//           border: Border.all(color: AppColor.greyMegaLight),
//           borderRadius: BorderRadius.circular(5),
//           color: Colors.white,
//         ),
//         child: Text(
//           slot.time,
//         ),
//       );
// }




// // slot.consultation != null && !slot.consultation!.isConfirmed!
// //           ? AppColor.warning
// //           : slot.consultation != null &&
// //                   isTimeBegin(
// //                       slot.consultation!.date!, slot.consultation!.time!)
// //               ? AppColor.mainColor
// //               : slot.consultation != null && slot.consultation!.isConfirmed!
// //                   ? AppColor.access
// //                   : AppColor.whiteColor













//------------------------------------------------------------
// import 'package:flutter/material.dart';
// import 'package:flutter_mobx/flutter_mobx.dart';
// import 'package:provider/provider.dart';

// import '../../entities/slot.dart';
// import '../../mobX/common/common_state.dart';
// import '../kons_screen_business/widgets/day_card.dart';
// import '../kons_screen_business/widgets/select_week.dart';

// class KonsShedulePage extends StatefulWidget {
//   const KonsShedulePage({super.key});

//   @override
//   State<KonsShedulePage> createState() => _KonsShedulePageState();
// }

// class _KonsShedulePageState extends State<KonsShedulePage> {
//   late CommonState state;

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     state = Provider.of<CommonState>(context);
//     state.getSlots();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Observer(builder: (context) {
//       return Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           const SelectWeek(),
//           !state.hasSlots
//               ? const Center(child: CircularProgressIndicator())
//               : Expanded(
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 20, vertical: 12),
//                     child: RefreshIndicator(
//                       onRefresh: () {
//                         return Provider.of<CommonState>(context, listen: false)
//                             .getSlots();
//                       },
//                       child: LayoutBuilder(
//                         builder: (context, constraints) {
//                           if (constraints.maxWidth < 600) {
//                             return ListView.builder(
//                                 itemCount: state.allSlots.length,
//                                 itemBuilder: (contex, index) {
//                                   List<Slot> slotToday = [];
//                                   var today =
//                                       state.allSlots[state.dates[index]]!;
//                                   for (var e in today) {
//                                     Slot slot = Slot.fromJson(e);
//                                     slotToday.add(slot);
//                                   }

//                                   return DayCard(
//                                       slotToday: slotToday,
//                                       date: state.dates[index],
//                                       isBusiness: false);
//                                 });
//                           } else {
//                             return ListView.builder(
//                               itemBuilder: (context, index) {
//                                 List<Slot> slotToday = [];
//                                 var today =
//                                     state.allSlots[state.dates[index * 2]]!;
//                                 for (var e in today) {
//                                   Slot slot = Slot.fromJson(e);
//                                   slotToday.add(slot);
//                                 }
//                                 return Expanded(
//                                   child: Padding(
//                                     padding: const EdgeInsets.only(bottom: 8.0),
//                                     child: Row(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         DayCard(
//                                             slotToday: slotToday,
//                                             date: state.dates[index * 2],
//                                             isBusiness: false),
//                                         const SizedBox(width: 8),
//                                         if (index * 2 + 1 <
//                                             state.allSlots.length)
//                                           DayCard(
//                                               slotToday: slotToday,
//                                               date: state.dates[index * 2 + 1],
//                                               isBusiness: false),
//                                       ],
//                                     ),
//                                   ),
//                                 );
//                               },
//                               itemCount: state.allSlots.length ~/ 2 +
//                                   1 * state.allSlots.length % 2,
//                             );
//                           }
//                         },
//                       ),
//                     ),
//                   ),
//                 ),
//         ],
//       );
//     });
//   }
// }
