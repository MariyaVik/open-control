import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:open_control/ui/navigation/route_name.dart';

import '../../dummy/current_user.dart';
import '../../dummy/kno_info.dart';
import '../../entities/consult_topics.dart';
import '../../entities/control_types.dart';
import '../../entities/kno.dart';
import '../../services/business_api.dart';
import '../common/utils.dart';
import '../common/week_day_date_time_widget.dart';
import '../theme/app_color.dart';
import 'widgets/drop_down_button.dart';
import '../../../dummy/current_kons.dart';

class SelectThemeView extends StatefulWidget {
  SelectThemeView({super.key});

  @override
  State<SelectThemeView> createState() => _SelectThemeViewState();
}

class _SelectThemeViewState extends State<SelectThemeView> {
  ConsultTopics? selectedValue;
  final TextEditingController textEditingController = TextEditingController();
  final TextEditingController quesController = TextEditingController();
  bool isNeedLetter = false;

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  NadzorOrgans getKNOById(int id) {
    return knos.where((element) => element.id == id).first;
  }

  @override
  Widget build(BuildContext context) {
    NadzorOrgans kno = getKNOById(currentKons.knoId!);
    return Padding(
      padding: const EdgeInsets.all(36.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(kno.name),
            WeekDayDateTimeWidget(consultation: currentKons),
            Text('Консультирование пройдет по ВКС в приложении'),
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
                    .where((element) => element.id == currentKons.controlTypeId)
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
                    height: 40,
                    // width: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppColor.greyLight))),
                dropdownStyleData: DropdownStyleData(
                    maxHeight: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppColor.greyLight))),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                ),
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
                    return (item.value!.name.toString().contains(searchValue));
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
            const Text('Вопрос'),
            TextField(controller: quesController, maxLines: 4),
            Row(
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
                      print(json);
                      await BusinessAPI.instance
                          .postConsultation(user.token!, currentKons);
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          AppNavRouteName.konsMainBusiness, (route) => false);
                    },
                    child: const Text('Записаться'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
