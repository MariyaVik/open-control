import 'dart:math';

import 'package:flutter/material.dart';

import '../../dummy/current_kons.dart';
import '../../entities/control_types.dart';
import '../../entities/kno.dart';
import '../common/circular_icon_button.dart';
import '../navigation/route_name.dart';
import '../theme/app_color.dart';

class KNODetails extends StatefulWidget {
  final NadzorOrgans kno;
  const KNODetails({Key? key, required this.kno}) : super(key: key);

  @override
  State<KNODetails> createState() => _KNODetailsState();
}

class _KNODetailsState extends State<KNODetails> {
  bool isExpand = false;
  ControlTypes? selectedValue;
  final TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColor.greyMegaLight,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.centerLeft,
                child: CircularIconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: AppColor.whiteColor,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                margin: const EdgeInsets.symmetric(vertical: 16),
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    Text(
                      widget.kno.name.toUpperCase(),
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontWeight: FontWeight.w500, fontSize: 20),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Главное архивное управление города Москвы (Главархив) реализует государственную политику в сфере архивного дела, а также охраны и использования историко-документального наследия.',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Вид контроля',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontWeight: FontWeight.w500, fontSize: 20),
                    ),
                    const SizedBox(height: 12),
                    //-----------------------------------------------------------------------------------------------------------------------------------------
                    // SelectWidget(
                    //     hint: 'Выберите вид контроля',
                    //     listItem: kno.controlTypes.map((e) => e.name).toList(),
                    //     formKey: controlTypeKey),
                    // DropdownButtonHideUnderline(
                    //   child: DropdownButton2<ControlTypes>(
                    //     isExpanded: true,
                    //     hint: Text(
                    //       'Выберите вид контроля',
                    //       style: TextStyle(
                    //         fontSize: 14,
                    //         color: Theme.of(context).hintColor,
                    //       ),
                    //     ),
                    //     items: widget.kno.controlTypes
                    //         // .map((e) => e.name)
                    //         // .toList()
                    //         .map((item) => DropdownMenuItem(
                    //               value: item,
                    //               child: Text(
                    //                 item.name,
                    //                 style: const TextStyle(
                    //                   fontSize: 14,
                    //                 ),
                    //               ),
                    //             ))
                    //         .toList(),
                    //     value: selectedValue,
                    //     onChanged: (value) {
                    //       setState(() {
                    //         selectedValue = value as ControlTypes;
                    //       });
                    //     },
                    //     buttonStyleData: ButtonStyleData(
                    //         height: 40,
                    //         // width: 200,
                    //         decoration: BoxDecoration(
                    //             borderRadius: BorderRadius.circular(10),
                    //             border: Border.all(color: AppColor.greyLight))),
                    //     dropdownStyleData: DropdownStyleData(
                    //         maxHeight: 200,
                    //         decoration: BoxDecoration(
                    //             borderRadius: BorderRadius.circular(10),
                    //             border: Border.all(color: AppColor.greyLight))),
                    //     menuItemStyleData: const MenuItemStyleData(
                    //       height: 40,
                    //     ),
                    //     dropdownSearchData: DropdownSearchData(
                    //       searchController: textEditingController,
                    //       searchInnerWidgetHeight: 50,
                    //       searchInnerWidget: Container(
                    //         height: 50,
                    //         padding: const EdgeInsets.only(
                    //           top: 8,
                    //           bottom: 4,
                    //           right: 8,
                    //           left: 8,
                    //         ),
                    //         child: TextFormField(
                    //           expands: true,
                    //           maxLines: null,
                    //           controller: textEditingController,
                    //           decoration: InputDecoration(
                    //             isDense: true,
                    //             contentPadding: const EdgeInsets.symmetric(
                    //               horizontal: 10,
                    //               vertical: 8,
                    //             ),
                    //             hintText: 'Начните вводить значение',
                    //             hintStyle: const TextStyle(fontSize: 12),
                    //             border: OutlineInputBorder(
                    //               borderRadius: BorderRadius.circular(8),
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //       searchMatchFn: (item, searchValue) {
                    //         return (item.value!.name
                    //             .toString()
                    //             .contains(searchValue));
                    //       },
                    //     ),
                    //     //This to clear the search value when you close the menu
                    //     onMenuStateChange: (isOpen) {
                    //       if (!isOpen) {
                    //         textEditingController.clear();
                    //       }
                    //     },
                    //   ),
                    // ),
                    //-----------------------------------------------------------------------------------------------------------------------------------------

                    GestureDetector(
                      onTap: () {
                        isExpand = !isExpand;
                        setState(() {});
                      },
                      child: Container(
                        decoration: isExpand
                            ? BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(color: AppColor.pinkDark),
                                boxShadow: const [
                                    BoxShadow(
                                        color: AppColor.pinkDark, blurRadius: 5)
                                  ])
                            : BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(color: AppColor.greyLight)),
                        // height: 48,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Text(
                                selectedValue == null
                                    ? 'Выберите вид контроля'
                                    : selectedValue!.name,
                                style: TextStyle(
                                    color: selectedValue == null
                                        ? AppColor.textLow
                                        : Colors.black),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              )),
                              IconButton(
                                  onPressed: () {
                                    isExpand = !isExpand;
                                    setState(() {});
                                  },
                                  icon: isExpand
                                      ? Transform.rotate(
                                          angle: 180 * pi / 180,
                                          child: const Icon(
                                            Icons.arrow_drop_down,
                                            color: AppColor.mainColor,
                                          ))
                                      : const Icon(
                                          Icons.arrow_drop_down,
                                          color: AppColor.textMain,
                                        ))
                            ],
                          ),
                        ),
                      ),
                    ),

                    if (isExpand)
                      Container(
                        margin: const EdgeInsets.only(top: 4),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6),
                            boxShadow: const [
                              BoxShadow(
                                  color: AppColor.greyLight, blurRadius: 5)
                            ]),
                        height: 220,
                        child: ListView.separated(
                          itemCount: widget.kno.controlTypes
                              .map((e) => e.name)
                              .toList()
                              .length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 16),
                              child: GestureDetector(
                                onTap: () {
                                  isExpand = false;
                                  selectedValue =
                                      widget.kno.controlTypes[index];
                                  setState(() {});
                                },
                                child: Text(
                                    widget.kno.controlTypes
                                        .map((e) => e.name)
                                        .toList()[index],
                                    style:
                                        Theme.of(context).textTheme.bodySmall),
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) =>
                              const Divider(color: AppColor.greyLight),
                        ),
                      ),

                    TextButton(
                        onPressed: () {},
                        child: const Text('Посмотреть требования')),
                    TextButton(
                        onPressed: () {},
                        child: const Text('Посмотреть нормативные акты')),
                    ElevatedButton(
                        onPressed: () {
                          currentKons.controlTypeId = selectedValue?.id;
                          Navigator.of(context).pushNamed(
                              AppNavRouteName.selectDateTimeBusiness,
                              arguments: widget.kno);
                        },
                        child: const Text('Перейти к выбору даты')),
                    const SizedBox(height: 16),
                    Text(
                      'Обзор',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontWeight: FontWeight.w500, fontSize: 20),
                    ),
                    const SizedBox(height: 16),
                    Column(
                      children: [
                        Container(
                          height: 80,
                          width: 80,
                          padding: const EdgeInsets.all(12),
                          decoration: const BoxDecoration(
                              color: AppColor.mainColor,
                              shape: BoxShape.circle),
                          child: Image.asset('assets/images/bust.png'),
                        ),
                        Text(
                          'Онопенко Ярослав Аксентьевич',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  fontWeight: FontWeight.w500, fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                        const Text(
                          'Начальник Главного архивного управления города Москвы',
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text('Контакты',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w500, fontSize: 20)),
                    const SizedBox(height: 16),
                    const Text('https://www.mos.ru/mosarchiv/'),
                    const Text('mosarch@mos.ru'),
                    const Text('Факс  +7 (495) 334-44-89'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
