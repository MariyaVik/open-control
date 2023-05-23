enum EntityFilter { nature, social, culture }

class EntityFilterItem {
  final String name;
  final String iconName;
  final EntityFilter filterName;
  EntityFilterItem(
      {required this.name, required this.iconName, required this.filterName});
}
