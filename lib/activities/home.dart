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
import 'package:wothcompanion/widgets/app/bar_scroll.dart';
import 'package:wothcompanion/widgets/app/padding.dart';
import 'package:wothcompanion/widgets/icon/icon.dart';
import 'package:wothcompanion/widgets/parts/home/menu.dart';
import 'package:wothcompanion/widgets/text/text.dart';
import 'package:wothcompanion/widgets/text/text_tap.dart';

class ActivityHome extends StatefulWidget {
  const ActivityHome({
    super.key,
  });

  @override
  ActivityHomeState createState() => ActivityHomeState();
}

class ActivityHomeState extends State<ActivityHome> {
  final List<List<dynamic>> _menuItems = [
    ["COMPANION:RESERVES", Assets.graphics.icons.reserve, const ListReserves()],
    ["UI:SECTION_ANIMALS", Assets.graphics.icons.animal, const ListAnimals()],
    ["UI:SECTION_FIREARMS", Assets.graphics.icons.firearm, const ListFirearms()],
    ["COMPANION:HUNTING_TABLE", Assets.graphics.icons.huntingTable, const ActivityHuntingTable()],
    ["UI:LIFE_CYCLE", Assets.graphics.icons.lifeCycle, const ActivityLifeCycle()],
    ["COMPANION:ABOUT", Assets.graphics.icons.about, const ActivityAbout()],
  ];

  Widget _buildName() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WidgetText(
          "WOTH COMPANION",
          color: Interface.primaryLight,
          style: Style.condensed.s22.w400,
        ),
        WidgetText(
          tr("COMPANION:NOT_OFFICIAL").toUpperCase(),
          color: Interface.primaryLight.withOpacity(0.4),
          style: Style.normal.s8.w400,
        ),
        WidgetText(
          Values.version,
          color: Interface.primaryLight.withOpacity(0.4),
          style: Style.normal.s12.w400,
        ),
      ],
    );
  }

  Widget _buildLink(String icon, [Function? onTap]) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) onTap();
      },
      child: WidgetIcon.withSize(
        icon,
        size: 17,
        color: Interface.primary,
      ),
    );
  }

  Widget _buildLinks() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildLink(Assets.graphics.icons.post, () => Utils.mailTo()),
            const SizedBox(width: 10),
            _buildLink(
              Assets.graphics.icons.reddit,
              () => Utils.redirectTo(
                Uri.parse("https://www.reddit.com/user/Toastovac/"),
              ),
            ),
            const SizedBox(width: 10),
            _buildLink(
              Assets.graphics.icons.github,
              () => Utils.redirectTo(
                Uri.parse("https://github.com/janstehno/woth-companion?tab=readme-ov-file#woth-companion"),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildHeader() {
    return Container(
      decoration: Interface.greenGradient,
      child: WidgetPadding.a30(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _buildName()),
            _buildLinks(),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(String text, String icon, Widget activity) {
    return WidgetSectionMenu(tr(text), icon: icon, onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (e) => activity));
    });
  }

  List<Widget> _listMenuItems() {
    return _menuItems.map((e) => _buildMenuItem(e.elementAt(0), e.elementAt(1), e.elementAt(2))).toList();
  }

  List<Widget> _listMenu() {
    return [
      ..._listMenuItems(),
      _buildMenuItem(
        "UI:SETTINGS",
        Assets.graphics.icons.settings,
        ActivitySettings(callback: () {
          setState(() {});
        }),
      ),
    ];
  }

  Widget _buildMenu() {
    return Container(
      alignment: Alignment.bottomLeft,
      child: WidgetScrollBar(
        child: SingleChildScrollView(
          child: WidgetPadding.v30(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _listMenu(),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _listOther() {
    return [
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
    ];
  }

  Widget _buildOther() {
    return Container(
      color: Interface.primaryDark.withOpacity(0.8),
      padding: const EdgeInsets.fromLTRB(30, 5, 30, 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: _listOther(),
      ),
    );
  }

  Widget _buildBackground() {
    return Image.asset(
      Assets.graphics.images.woth.path,
      fit: BoxFit.cover,
      alignment: Alignment.center,
    );
  }

  Widget _buildShadow() {
    return Container(color: Interface.primaryDark.withOpacity(0.6));
  }

  Widget _buildWidgets() {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        fit: StackFit.expand,
        children: [
          _buildBackground(),
          _buildShadow(),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildHeader(),
              Expanded(child: _buildMenu()),
              _buildOther(),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) => _buildWidgets();
}
