import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../../dummy/current_kons.dart';
import '../../entities/control_types.dart';
import '../../entities/kno.dart';
import '../common/close_button.dart';
import '../navigation/route_name.dart';
import '../theme/app_color.dart';
import 'widgets/drop_down_button.dart';

class KNODetails extends StatefulWidget {
  final NadzorOrgans kno;
  const KNODetails({Key? key, required this.kno}) : super(key: key);

  @override
  State<KNODetails> createState() => _KNODetailsState();
}

class _KNODetailsState extends State<KNODetails> {
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
      color: AppColor.greyLight,
      child: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: CloseButtonMy(),
              ),
              Text(widget.kno.name.toUpperCase()),
              Text(
                'Главное архивное управление города Москвы (Главархив) реализует государственную политику в сфере архивного дела, а также охраны и использования историко-документального наследия.',
              ),
              const Text('Вид контроля'),
//-----------------------------------------------------------------------------------------------------------------------------------------
              // SelectWidget(
              //     hint: 'Выберите вид контроля',
              //     listItem: kno.controlTypes.map((e) => e.name).toList(),
              //     formKey: controlTypeKey),
              DropdownButtonHideUnderline(
                child: DropdownButton2<ControlTypes>(
                  isExpanded: true,
                  hint: Text(
                    'Выберите вид контроля',
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                  items: widget.kno.controlTypes
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
                      selectedValue = value as ControlTypes;
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
              TextButton(
                  onPressed: () {}, child: Text('Посмотреть требования')),
              TextButton(
                  onPressed: () {}, child: Text('Посмотреть нормативные акты')),
              ElevatedButton(
                  onPressed: () {
                    currentKons.controlTypeId = selectedValue?.id;
                    Navigator.of(context).pushNamed(
                        AppNavRouteName.selectDateTime,
                        arguments: widget.kno);
                  },
                  child: Text('Перейти к выбору даты'))
            ],
          ),
        ),
      ),
    );
  }
}
