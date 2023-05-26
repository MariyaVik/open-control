import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../../theme/app_color.dart';

class SelectWidget extends StatefulWidget {
  final String hint;
  final List<String> listItem;
  final GlobalKey<FormState> formKey;
  const SelectWidget(
      {required this.hint,
      required this.listItem,
      required this.formKey,
      super.key});
  // const SelectWidget({super.key});
  @override
  State<SelectWidget> createState() => _SelectWidgetState();
}

class _SelectWidgetState extends State<SelectWidget> {
  String? selectedValue;
  final TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        hint: Text(
          widget.hint,
          style: TextStyle(
            fontSize: 14,
            color: Theme.of(context).hintColor,
          ),
        ),
        items: widget.listItem
            .map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ))
            .toList(),
        value: selectedValue,
        onChanged: (value) {
          setState(() {
            selectedValue = value as String;
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
            return (item.value.toString().contains(searchValue));
          },
        ),
        //This to clear the search value when you close the menu
        onMenuStateChange: (isOpen) {
          if (!isOpen) {
            textEditingController.clear();
          }
        },
      ),
    );
  }

//--------------------------------------------------------
  // final List<String> genderItems = [
  //   'Male',
  //   'Female',
  // ];

  // String? selectedValue;

  // final _formKey = GlobalKey<FormState>();

  // @override
  // Widget build(BuildContext context) {
  //   return Form(
  //     key: _formKey,
  //     child: Padding(
  //       padding: const EdgeInsets.symmetric(horizontal: 80),
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           TextFormField(
  //             decoration: InputDecoration(
  //               contentPadding: const EdgeInsets.symmetric(
  //                 horizontal: 20,
  //                 vertical: 20,
  //               ),
  //               hintText: 'Enter Your Full Name.',
  //               hintStyle: const TextStyle(fontSize: 14),
  //               border: OutlineInputBorder(
  //                 borderRadius: BorderRadius.circular(15),
  //               ),
  //             ),
  //           ),
  //           const SizedBox(height: 30),
  //           DropdownButtonFormField2(
  //             decoration: InputDecoration(
  //               //Add isDense true and zero Padding.
  //               //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
  //               isDense: true,

  //               contentPadding: EdgeInsets.zero,
  //               border: OutlineInputBorder(
  //                 borderRadius: BorderRadius.circular(30),
  //               ),
  //               //Add more decoration as you want here
  //               //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
  //             ),
  //             isExpanded: true,
  //             hint: const Text(
  //               'Select Your Gender',
  //               style: TextStyle(fontSize: 14),
  //             ),
  //             items: genderItems
  //                 .map((item) => DropdownMenuItem<String>(
  //                       value: item,
  //                       child: Text(
  //                         item,
  //                         style: const TextStyle(
  //                           fontSize: 14,
  //                         ),
  //                       ),
  //                     ))
  //                 .toList(),
  //             validator: (value) {
  //               if (value == null) {
  //                 return 'Please select gender.';
  //               }
  //               return null;
  //             },
  //             onChanged: (value) {
  //               //Do something when changing the item if you want.
  //             },
  //             onSaved: (value) {
  //               selectedValue = value.toString();
  //             },
  //             buttonStyleData: const ButtonStyleData(
  //               height: 60,
  //               padding: EdgeInsets.only(left: 20, right: 10),
  //             ),
  //             iconStyleData: const IconStyleData(
  //               icon: Icon(
  //                 Icons.arrow_drop_down,
  //                 color: Colors.black45,
  //               ),
  //               iconSize: 30,
  //             ),
  //             dropdownStyleData: DropdownStyleData(
  //               decoration: BoxDecoration(
  //                 borderRadius: BorderRadius.circular(15),
  //               ),
  //             ),
  //           ),
  //           const SizedBox(height: 30),
  //           TextButton(
  //             onPressed: () {
  //               if (_formKey.currentState!.validate()) {
  //                 _formKey.currentState!.save();
  //               }
  //             },
  //             child: const Text('Submit Button'),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
