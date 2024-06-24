import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wothcompanion/generated/assets.gen.dart';
import 'package:wothcompanion/interface/interface.dart';
import 'package:wothcompanion/interface/style.dart';
import 'package:wothcompanion/miscellaneous/utils.dart';
import 'package:wothcompanion/miscellaneous/values.dart';
import 'package:wothcompanion/widgets/app/margin.dart';
import 'package:wothcompanion/widgets/app/padding.dart';
import 'package:wothcompanion/widgets/button/button_swipe.dart';
import 'package:wothcompanion/widgets/fullscreen/home_menu.dart';
import 'package:wothcompanion/widgets/icon/icon.dart';
import 'package:wothcompanion/widgets/text/text.dart';

class ActivityHome extends StatefulWidget {
  const ActivityHome({
    super.key,
  });

  @override
  ActivityHomeState createState() => ActivityHomeState();
}

class ActivityHomeState extends State<ActivityHome> {
  bool _menuOpened = false;

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
          style: Style.normal.s12.w600,
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
        color: Interface.primaryLight,
      ),
    );
  }

  Widget _buildLinks() {
    return Row(
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
            Uri.parse("https://github.com/janstehno/woth-companion"),
          ),
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

  Widget _buildSwipe() {
    return WidgetMargin.bottom(
      30,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          WidgetButtonSwipe(
            Assets.graphics.icons.tap,
            background: Interface.transparent,
            onTap: () {
              setState(() {
                _menuOpened = true;
              });
            },
          ),
        ],
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
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          transform: const GradientRotation(pi / 2),
          colors: [
            Interface.dark0D.withOpacity(0.1),
            Interface.dark0D.withOpacity(0.4),
            Interface.dark0D.withOpacity(0.6),
          ],
        ),
      ),
    );
  }

  Widget _buildCenter() {
    Size screenSize = MediaQuery.of(context).size;
    EdgeInsets screenPadding = MediaQuery.of(context).padding;
    double menuWidth = screenSize.width > 500 ? 0.6 * screenSize.width : screenSize.width;

    return Stack(
      fit: StackFit.expand,
      children: [
        _buildBackground(),
        _buildShadow(),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildHeader(),
            _buildSwipe(),
          ],
        ),
        AnimatedPositioned(
          width: menuWidth,
          height: screenSize.height - screenPadding.bottom,
          left: _menuOpened ? 0 : -menuWidth,
          duration: const Duration(milliseconds: 400),
          child: WidgetHomeMenu(callback: () {
            setState(() {
              _menuOpened = false;
            });
          }),
        ),
      ],
    );
  }

  Widget _buildWidgets() {
    return Scaffold(
      appBar: AppBar(),
      body: GestureDetector(
        onHorizontalDragUpdate: (details) {
          setState(() {
            if (details.delta.direction > 1) {
              _menuOpened = false;
            } else {
              _menuOpened = true;
            }
          });
        },
        child: _buildCenter(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => _buildWidgets();
}
