import 'package:flutter/material.dart';
import 'package:wothcompanion/interface/interface.dart';
import 'package:wothcompanion/interface/values.dart';
import 'package:wothcompanion/widgets/title/title.dart';

class WidgetSubtitle extends WidgetTitle {
  const WidgetSubtitle(
    super.text, {
    super.key,
  });

  @override
  double get height => Values.subtitle;

  @override
  Color get background => Interface.subtitle;
}
