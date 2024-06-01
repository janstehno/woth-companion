import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:wothcompanion/activities/list/items.dart';
import 'package:wothcompanion/builders/map.dart';
import 'package:wothcompanion/helpers/filter.dart';
import 'package:wothcompanion/model/translatables/reserve.dart';
import 'package:wothcompanion/widgets/parts/reserve/reserve.dart';

class ListReserves extends ListItems {
  const ListReserves({
    super.key,
  }) : super("COMPANION:RESERVES");

  @override
  ListReservesState createState() => ListReservesState();
}

class ListReservesState extends ListItemsState<Reserve> {
  @override
  List<Reserve> get items => HelperFilter.filterReserves(controller.text).sorted(Reserve.sortByName);

  @override
  void onTap(Reserve item) {
    Navigator.push(context, MaterialPageRoute(builder: (e) => BuilderMap(reserve: item)));
  }

  @override
  WidgetReserve buildEntry(int index, Reserve item) {
    return WidgetReserve(
      index: index,
      entry: item,
      onTap: () {
        onTap(item);
      },
    );
  }
}
