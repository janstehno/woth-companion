import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wothcompanion/activities/about.dart';
import 'package:wothcompanion/activities/hunting_table.dart';
import 'package:wothcompanion/activities/life_cycle.dart';
import 'package:wothcompanion/activities/list/animals.dart';
import 'package:wothcompanion/activities/list/firearms.dart';
import 'package:wothcompanion/activities/list/reserves.dart';
import 'package:wothcompanion/activities/settings.dart';
import 'package:wothcompanion/generated/assets.gen.dart';
import 'package:wothcompanion/interface/interface.dart';
import 'package:wothcompanion/interface/style.dart';
import 'package:wothcompanion/miscellaneous/utils.dart';
import 'package:wothcompanion/miscellaneous/values.dart';
import 'package:wothcompanion/widgets/app/margin.dart';
import 'package:wothcompanion/widgets/app/padding.dart';
import 'package:wothcompanion/widgets/button/button_icon.dart';
import 'package:wothcompanion/widgets/icon/icon.dart';
import 'package:wothcompanion/widgets/parts/home/menu.dart';
import 'package:wothcompanion/widgets/text/text.dart';
import 'package:wothcompanion/widgets/text/text_tap.dart';

class WidgetHomeMenu extends StatefulWidget {
  final Function _callback;

  const WidgetHomeMenu({
    super.key,
    required Function callback,
  }) : _callback = callback;

  Function get callback => _callback;

  @override
  WidgetHomeMenuState createState() => WidgetHomeMenuState();
}

class WidgetHomeMenuState extends State<WidgetHomeMenu> {
  final List<List<dynamic>> _general = [
    ["COMPANION:RESERVES", Assets.graphics.icons.reserve, const ListReserves()],
    ["UI:SECTION_ANIMALS", Assets.graphics.icons.animal, const ListAnimals()],
    ["UI:SECTION_FIREARMS", Assets.graphics.icons.firearm, const ListFirearms()],
  ];

  final List<List<dynamic>> _tools = [
    ["COMPANION:HUNTING_TABLE", Assets.graphics.icons.huntingTable, const ActivityHuntingTable()],
    ["UI:LIFE_CYCLE", Assets.graphics.icons.lifeCycle, const ActivityLifeCycle()],
  ];

  Widget _buildMenuItem(String text, String icon, Widget activity, BuildContext context) {
    return WidgetSectionMenu(tr(text), icon: icon, onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (e) => activity));
    });
  }

  Widget _buildHeader() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        WidgetIcon.withSize(
          Assets.graphics.icons.reserve,
          color: Interface.primaryLight,
          size: Values.section - 10,
        ),
        WidgetButtonIcon(
          Assets.graphics.icons.cancel,
          color: Interface.primaryLight,
          background: Interface.transparent,
          onTap: () {
            widget.callback();
          },
        ),
      ],
    );
  }

  List<Widget> _listGeneral() {
    return [
      WidgetMargin.fromLTRB(
        0,
        40,
        0,
        10,
        child: WidgetText(
          tr("UI:GENERAL").toUpperCase(),
          color: Interface.primaryLight,
          style: Style.condensed.s26.w400,
        ),
      ),
      ..._general.map((e) => _buildMenuItem(e.elementAt(0), e.elementAt(1), e.elementAt(2), context)),
    ];
  }

  List<Widget> _listTools() {
    return [
      WidgetMargin.fromLTRB(
        0,
        40,
        0,
        10,
        child: WidgetText(
          tr("COMPANION:TOOLS").toUpperCase(),
          color: Interface.primaryLight,
          style: Style.condensed.s26.w400,
        ),
      ),
      ..._tools.map((e) => _buildMenuItem(e.elementAt(0), e.elementAt(1), e.elementAt(2), context)),
    ];
  }

  List<Widget> _listUncategorized() {
    return [
      WidgetSectionMenu(tr("UI:SETTINGS"), onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (e) => ActivitySettings(callback: () {
              setState(() {});
            }),
          ),
        );
      }),
      WidgetSectionMenu(tr("COMPANION:ABOUT"), onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (e) => const ActivityAbout()));
      }),
    ];
  }

  Widget _buildFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        WidgetTextTap(
          tr("COMPANION:WIKI").toUpperCase(),
          color: Interface.primaryLight.withOpacity(0.8),
          style: Style.normal.s8.w600,
          onTap: () => Utils.redirectTo(
            Uri.parse("https://github.com/janstehno/woth-companion/wiki"),
          ),
        ),
        const SizedBox(width: 10),
        WidgetTextTap(
          tr("COMPANION:PATCH_NOTES").toUpperCase(),
          color: Interface.primaryLight.withOpacity(0.8),
          style: Style.normal.s8.w600,
          onTap: () => Utils.redirectTo(
            Uri.parse("https://github.com/janstehno/woth-companion/wiki/Patch-notes"),
          ),
        ),
        const SizedBox(width: 10),
        WidgetTextTap(
          tr("COMPANION:IDEAS").toUpperCase(),
          color: Interface.primaryLight.withOpacity(0.8),
          style: Style.normal.s8.w600,
          onTap: () => Utils.redirectTo(
            Uri.parse("https://github.com/janstehno/woth-companion/discussions"),
          ),
        ),
        const SizedBox(width: 10),
        WidgetTextTap(
          tr("COMPANION:ISSUES").toUpperCase(),
          color: Interface.primaryLight.withOpacity(0.8),
          style: Style.normal.s8.w600,
          onTap: () => Utils.redirectTo(
            Uri.parse("https://github.com/janstehno/woth-companion/issues"),
          ),
        ),
      ],
    );
  }

  List<Widget> _listItems(BuildContext context) {
    return [
      _buildHeader(),
      ..._listGeneral(),
      ..._listTools(),
      const SizedBox(height: 30),
      ..._listUncategorized(),
      const SizedBox(height: 30),
      _buildFooter(),
      const SizedBox(height: 15),
    ];
  }

  Widget _buildBackground() {
    return Image.asset(
      Assets.graphics.images.green.path,
      fit: BoxFit.cover,
      alignment: Alignment.center,
    );
  }

  Widget _buildShadow() {
    return Container(color: Interface.primaryDark.withOpacity(0.6));
  }

  Widget _buildList() {
    return Container(
      alignment: Alignment.topLeft,
      child: SingleChildScrollView(
        child: WidgetPadding.all(
          40,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: _listItems(context),
          ),
        ),
      ),
    );
  }

  Widget _buildWidgets(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        _buildBackground(),
        _buildShadow(),
        _buildList(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) => _buildWidgets(context);
}
