import 'package:flutter/material.dart';
import 'package:wothcompanion/interface/interface.dart';
import 'package:wothcompanion/interface/style.dart';
import 'package:wothcompanion/model/translatables/reserve.dart';
import 'package:wothcompanion/widgets/parts/entries/entry.dart';
import 'package:wothcompanion/widgets/text/text.dart';

class WidgetReserve extends WidgetEntry<Reserve> {
  const WidgetReserve({
    super.key,
    required super.index,
    required super.entry,
    required super.onTap,
  });

  @override
  Widget buildText() {
    return WidgetText(
      entry.name,
      color: Interface.primaryLight,
      style: Style.normal.s16.w400,
      maxLines: 2,
    );
  }
}
