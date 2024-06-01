import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:wothcompanion/activities/detail/firearm.dart';
import 'package:wothcompanion/activities/list/items.dart';
import 'package:wothcompanion/helpers/filter.dart';
import 'package:wothcompanion/model/translatables/firearm.dart';
import 'package:wothcompanion/widgets/parts/firearm/firearm.dart';

class ListFirearms extends ListItems {
  const ListFirearms({
    super.key,
  }) : super("UI:SECTION_FIREARMS");

  @override
  ListFirearmsState createState() => ListFirearmsState();
}

class ListFirearmsState extends ListItemsState<Firearm> {
  @override
  List<Firearm> get items => HelperFilter.filterFirearms(controller.text).sorted(Firearm.sortByTierCaliberName);

  @override
  void onTap(Firearm item) {
    Navigator.push(context, MaterialPageRoute(builder: (e) => DetailFirearm(firearm: item)));
  }

  @override
  Widget buildEntry(int index, Firearm item) {
    return WidgetFirearm(
      index: index,
      entry: item,
      onTap: () {
        onTap(item);
      },
    );
  }
}
