import 'package:flutter/material.dart';
import 'package:wothcompanion/interface/interface.dart';
import 'package:wothcompanion/interface/style.dart';
import 'package:wothcompanion/model/translatables/animal.dart';
import 'package:wothcompanion/widgets/parts/entries/entry.dart';
import 'package:wothcompanion/widgets/text/text.dart';

class WidgetAnimal extends WidgetEntry<Animal> {
  const WidgetAnimal({
    super.key,
    required super.index,
    required super.entry,
    required super.onTap,
  });

  @override
  Widget buildRight() {
    return WidgetText(
      entry.tier.toString(),
      color: Interface.primaryLight,
      style: Style.normal.s16.w400,
    );
  }

  @override
  Widget buildText() {
    return WidgetText(
      entry.name,
      color: Interface.primaryLight,
      style: Style.normal.s16.w400,
    );
  }

  @override
  Widget buildSubText() {
    return WidgetText(
      entry.latin,
      color: Interface.primaryLight.withOpacity(0.6),
      style: Style.normal.s12.w400i,
    );
  }
}
