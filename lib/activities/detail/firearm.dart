import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wothcompanion/interface/interface.dart';
import 'package:wothcompanion/interface/style.dart';
import 'package:wothcompanion/lists/detail_firearm/firearm_animals.dart';
import 'package:wothcompanion/lists/detail_firearm/firearm_energy.dart';
import 'package:wothcompanion/model/translatables/firearm.dart';
import 'package:wothcompanion/widgets/app/bar_app.dart';
import 'package:wothcompanion/widgets/app/divider.dart';
import 'package:wothcompanion/widgets/app/padding.dart';
import 'package:wothcompanion/widgets/app/scaffold.dart';
import 'package:wothcompanion/widgets/text/text.dart';
import 'package:wothcompanion/widgets/title/title.dart';

class DetailFirearm extends StatelessWidget {
  final Firearm _firearm;

  const DetailFirearm({
    super.key,
    required Firearm firearm,
  }) : _firearm = firearm;

  Widget _buildSpace() {
    return const SizedBox(height: 3);
  }

  Widget _buildName() {
    return WidgetPadding.a30(
      alignment: Alignment.center,
      child: Column(
        children: [
          WidgetText(
            _firearm.name.toUpperCase(),
            color: Interface.primary,
            style: Style.condensed.s22.w400,
          ),
          _buildSpace(),
          WidgetText(
            _firearm.caliber,
            color: Interface.disabled,
            style: Style.normal.s12.w400i,
          ),
        ],
      ),
    );
  }

  Widget _buildHuntingTier() {
    return WidgetPadding.fromLTRB(
      30,
      30,
      30,
      0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WidgetText(
            tr("UI:TIER").toUpperCase(),
            color: Interface.disabled,
            style: Style.condensed.s18.w300,
          ),
          _buildSpace(),
          WidgetText(
            _firearm.tier.toString(),
            color: Interface.primaryLight,
            style: Style.normal.s16.w400,
          ),
        ],
      ),
    );
  }

  Widget _buildMagCapacity() {
    return WidgetPadding.fromLTRB(
      30,
      15,
      30,
      0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WidgetText(
            tr("COMPANION:FIREARM_MAG").toUpperCase(),
            color: Interface.disabled,
            style: Style.condensed.s18.w300,
          ),
          _buildSpace(),
          WidgetText(
            _firearm.mag.toString(),
            color: Interface.primaryLight,
            style: Style.normal.s16.w400,
          ),
        ],
      ),
    );
  }

  Widget _buildAction() {
    return WidgetPadding.fromLTRB(
      30,
      15,
      30,
      30,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WidgetText(
            tr("COMPANION:FIREARM_ACTION").toUpperCase(),
            color: Interface.disabled,
            style: Style.condensed.s18.w300,
          ),
          _buildSpace(),
          WidgetText(
            _firearm.action,
            color: Interface.primaryLight,
            style: Style.normal.s16.w400,
          ),
        ],
      ),
    );
  }

  List<Widget> _listRangeEnergy() {
    return [
      WidgetTitle(tr("COMPANION:ENERGY_DISTRIBUTION").toUpperCase()),
      WidgetPadding.a30(child: ListFirearmEnergy(_firearm)),
    ];
  }

  List<Widget> _listRecommendedAnimals() {
    return [
      WidgetTitle(tr("UI:SECTION_ANIMALS").toUpperCase()),
      WidgetPadding.a30(child: ListFirearmAnimals(_firearm)),
    ];
  }

  Widget _buildWidgets(BuildContext context) {
    return WidgetScaffold(
      appBar: WidgetAppBar(
        tr("UI:SECTION_FIREARMS"),
        context: context,
      ),
      children: [
        _buildName(),
        const WidgetDivider(),
        _buildHuntingTier(),
        _buildMagCapacity(),
        _buildAction(),
        ..._listRangeEnergy(),
        ..._listRecommendedAnimals(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) => _buildWidgets(context);
}
