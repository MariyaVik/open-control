import 'dart:math';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:open_control/ui/navigation/route_name.dart';
import 'package:provider/provider.dart';

import '../../entities/consult_topics.dart';
import '../../entities/faq.dart';
import '../../entities/kno.dart';
import '../../mobX/common/common_state.dart';
import '../../services/business_api.dart';
import '../common/app_bar_back.dart';
import '../common/utils.dart';
import '../common/week_day_date_time_widget.dart';
import '../faq/faq_card.dart';
import '../theme/app_color.dart';
import '../../../dummy/current_kons.dart';

class SelectThemeView extends StatefulWidget {
  const SelectThemeView({super.key});

  @override
  State<SelectThemeView> createState() => _SelectThemeViewState();
}

class _SelectThemeViewState extends State<SelectThemeView> {
  ConsultTopics? selectedValue;
  final TextEditingController textEditingController = TextEditingController();
  final TextEditingController quesController = TextEditingController();
  bool isNeedLetter = false;

  List<Faq> sameQuestions = [];
  bool isExpandSame = false;

  @override
  void dispose() {
    textEditingController.dispose();
    quesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    NadzorOrgans kno = getKNOById(context, currentKons.knoId!);
    return Scaffold(
      appBar: appBarBack(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          clipBehavior: Clip.none,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                kno.name.toUpperCase(),
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: AppColor.textMain),
              ),
              const SizedBox(height: 20),
              WeekDayDateTimeWidget(consultation: currentKons),
              const SizedBox(height: 16),
              Text('Консультирование пройдет по ВКС в приложении',
                  style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: 20),
              const Text('Тема консультирования'),
              //-----------------------------------------------------------------------------------------------------------------------------------------
              // SelectWidget(
              //     hint: 'Выберите тему', listItem: ['1', '2'], formKey: themeKey),
              DropdownButtonHideUnderline(
                child: DropdownButton2<ConsultTopics>(
                  isExpanded: true,
                  hint: Text(
                    'Выберите вид контроля',
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                  items: kno.controlTypes
                      .where(
                          (element) => element.id == currentKons.controlTypeId)
                      .first
                      .consultTopics
                      // .map((e) => e.name)
                      // .toList()
                      .map((item) => DropdownMenuItem(
                            value: item,
                            child: Text(
                              item.name,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ))
                      .toList(),
                  value: selectedValue,
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value as ConsultTopics;
                    });
                  },
                  buttonStyleData: ButtonStyleData(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                            color: MaterialStateColor.resolveWith(
                                (Set<MaterialState> states) => states.contains(
                                        MaterialState.focused) // не работает :(
                                    ? AppColor.mainColor
                                    : AppColor.greyLight),
                          ))),
                  dropdownStyleData: DropdownStyleData(
                      maxHeight: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: AppColor.greyLight))),
                  menuItemStyleData: const MenuItemStyleData(),
                  dropdownSearchData: DropdownSearchData(
                    searchController: textEditingController,
                    searchInnerWidgetHeight: 50,
                    searchInnerWidget: Container(
                      height: 50,
                      padding: const EdgeInsets.only(
                        top: 8,
                        bottom: 4,
                        right: 8,
                        left: 8,
                      ),
                      child: TextFormField(
                        expands: true,
                        maxLines: null,
                        controller: textEditingController,
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 8,
                          ),
                          hintText: 'Начните вводить значение',
                          hintStyle: const TextStyle(fontSize: 12),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    searchMatchFn: (item, searchValue) {
                      return (item.value!.name
                          .toString()
                          .contains(searchValue));
                    },
                  ),
                  //This to clear the search value when you close the menu
                  onMenuStateChange: (isOpen) {
                    if (!isOpen) {
                      textEditingController.clear();
                    }
                  },
                ),
              ),
              //-----------------------------------------------------------------------------------------------------------------------------------------
              const SizedBox(height: 20),
              const Text('Вопрос'),
              TextField(
                textInputAction: TextInputAction.done,
                controller: quesController,
                maxLines: 3,
                onEditingComplete: () async {
                  sameQuestions = await BusinessAPI.instance.postFaq(
                      Provider.of<CommonState>(context, listen: false)
                          .user
                          .token!,
                      quesController.text);
                  FocusManager.instance.primaryFocus?.unfocus();
                  if (sameQuestions.isNotEmpty) isExpandSame = true;

                  setState(() {});
                },
                onChanged: (value) {},
              ),
              const SizedBox(height: 16),

              if (sameQuestions.isNotEmpty)
                GestureDetector(
                  onTap: () {
                    isExpandSame = !isExpandSame;
                    setState(() {});
                  },
                  child: Container(
                    decoration: isExpandSame
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
                    height: 48,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        children: [
                          const Expanded(
                              child: Text(
                            'Похожие вопросы',
                            style: TextStyle(color: AppColor.textLow),
                          )),
                          IconButton(
                              onPressed: () {},
                              icon: isExpandSame
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

              if (isExpandSame)
                Container(
                  margin: const EdgeInsets.only(top: 4),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: const [
                        BoxShadow(color: AppColor.greyLight, blurRadius: 5)
                      ]),
                  height: 220,
                  child: ListView.separated(
                    itemCount: sameQuestions.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 16),
                        child: FaqContent(faq: sameQuestions[index]),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(color: AppColor.greyLight),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  children: [
                    Checkbox(
                      value: isNeedLetter,
                      onChanged: ((value) {
                        isNeedLetter = !isNeedLetter;
                        setState(() {});
                      }),
                    ),
                    const Expanded(
                      child: Text(
                          'Хочу получить письменное разъяснение по результатам консультирования'),
                    ),
                  ],
                ),
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        'Отмена',
                        style: TextStyle(color: Colors.black),
                      )),
                  ElevatedButton(
                      onPressed: () async {
                        currentKons.consultTopicId = selectedValue!.id;
                        currentKons.question = quesController.text;
                        currentKons.isNeedLetter = isNeedLetter;
                        // print(currentKons);
                        var json = currentKons.toJson();
                        await BusinessAPI.instance.postConsultation(
                            Provider.of<CommonState>(context, listen: false)
                                .user
                                .token!,
                            currentKons);
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            AppNavRouteName.konsMainBusiness, (route) => false);
                      },
                      child: const Text('Записаться'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
