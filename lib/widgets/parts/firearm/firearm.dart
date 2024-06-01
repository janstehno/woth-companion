import 'package:flutter/material.dart';
import 'package:wothcompanion/interface/interface.dart';
import 'package:wothcompanion/interface/style.dart';
import 'package:wothcompanion/model/translatables/firearm.dart';
import 'package:wothcompanion/widgets/parts/entries/entry.dart';
import 'package:wothcompanion/widgets/text/text.dart';

class WidgetFirearm extends WidgetEntry<Firearm> {
  const WidgetFirearm({
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
    );
  }

  @override
  Widget? buildSubText() {
    return WidgetText(
      entry.caliber,
      color: Interface.primaryLight.withOpacity(0.6),
      style: Style.normal.s12.w400i,
    );
  }

  @override
  Widget? buildRight() {
    return WidgetText(
      entry.tier.toString(),
      color: Interface.primaryLight,
      style: Style.normal.s16.w400,
    );
  }
}
