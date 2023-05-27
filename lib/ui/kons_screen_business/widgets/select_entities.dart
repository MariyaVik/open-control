import 'package:flutter/material.dart';
import '../../../entities/filter_kno.dart';
import '../../theme/app_color.dart';

class SelectEntityWidget extends StatefulWidget {
  const SelectEntityWidget({super.key});

  @override
  State<SelectEntityWidget> createState() => _SelectEntityWidgetState();
}

class _SelectEntityWidgetState extends State<SelectEntityWidget> {
  final List<EntityFilterItem> _chips = [
    EntityFilterItem(
        name: 'Общежития',
        iconName: 'assets/icons/nature.png',
        filterName: EntityFilter.nature),
    EntityFilterItem(
        name: 'События',
        iconName: 'assets/icons/social.png',
        filterName: EntityFilter.social),
    EntityFilterItem(
        name: 'Лаборатории',
        iconName: 'assets/icons/culture.png',
        filterName: EntityFilter.culture),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          // physics: NeverScrollableScrollPhysics(),
          // scrollDirection: Axis.horizontal,
          children: [
            const SizedBox(width: 16),
            ..._chips
                .map((item) => Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: FilterChip(
                        onSelected: (isSelected) {
                          // if (isSelected) {
                          //   commonState.entity = item.filterName;
                          // }
                          // print(commonState.entity.toString());
                          // setState(() {});
                        },
                        // selected: commonState.entity == item.filterName,
                        label: Text(item.name),
                        avatar: ImageIcon(
                          AssetImage(item.iconName),
                          color: AppColor.whiteColor,
                        ),
                      ),
                    ))
                .toList(),
          ],
        ),
      ),
    );
  }
}
