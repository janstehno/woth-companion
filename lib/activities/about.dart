import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wothcompanion/generated/assets.gen.dart';
import 'package:wothcompanion/interface/interface.dart';
import 'package:wothcompanion/interface/style.dart';
import 'package:wothcompanion/miscellaneous/utils.dart';
import 'package:wothcompanion/widgets/app/bar_app.dart';
import 'package:wothcompanion/widgets/app/padding.dart';
import 'package:wothcompanion/widgets/app/scaffold.dart';
import 'package:wothcompanion/widgets/button/button_icon.dart';
import 'package:wothcompanion/widgets/button/button_text.dart';
import 'package:wothcompanion/widgets/text/text.dart';
import 'package:wothcompanion/widgets/text/text_pattern.dart';
import 'package:wothcompanion/widgets/title/title.dart';

class ActivityAbout extends StatelessWidget {
  const ActivityAbout({
    super.key,
  });

  Widget _buildAbout() {
    return WidgetPadding.a30(
      child: Wrap(
        spacing: 15,
        runSpacing: 15,
        children: [
          WidgetText(
            tr("COMPANION:ABOUT_APP"),
            color: Interface.primaryLight,
            style: Style.normal.s16.w400,
            autoSize: false,
          ),
          WidgetTextPattern(tr("COMPANION:ABOUT_NEKHEBU")),
          WidgetButtonText(
            "Way of the Hunter Toolbox",
            color: Interface.primaryDark,
            background: Interface.primary,
            onTap: () => Utils.redirectTo(
              Uri.parse("https://github.com/codeaid.github.io/woth-toolbox"),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _listLanguage() {
    return [
      WidgetTitle(tr("UI:LANGUAGE")),
      WidgetPadding.a30(
        child: WidgetText(
          tr("COMPANION:ABOUT_LANGUAGE"),
          color: Interface.primaryLight,
          style: Style.normal.s16.w400,
          autoSize: false,
        ),
      )
    ];
  }

  List<Widget> _listDonationPlatforms() {
    return [
      WidgetButtonIcon(
        Assets.graphics.icons.paypal,
        color: Interface.primaryDark,
        background: Interface.primary,
        onTap: () => Utils.redirectTo(Uri.parse("https://paypal.me/toastovac")),
      ),
      WidgetButtonIcon(
        Assets.graphics.icons.coffee,
        color: Interface.primaryDark,
        background: Interface.primary,
        onTap: () => Utils.redirectTo(Uri.parse("https://buymeacoffee.com/toastovac")),
      ),
      WidgetButtonIcon(
        Assets.graphics.icons.patreon,
        color: Interface.primaryDark,
        background: Interface.primary,
        onTap: () => Utils.redirectTo(Uri.parse("https://patreon.com/Toastovac")),
      ),
    ];
  }

  List<Widget> _listDonation() {
    return [
      WidgetTitle(tr("COMPANION:DONATION")),
      WidgetPadding.a30(
        child: Wrap(
          spacing: 15,
          runSpacing: 15,
          children: [
            WidgetText(
              tr("COMPANION:ABOUT_DONATION"),
              color: Interface.primaryLight,
              style: Style.normal.s16.w400,
              autoSize: false,
            ),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              alignment: WrapAlignment.center,
              children: _listDonationPlatforms(),
            )
          ],
        ),
      ),
    ];
  }

  Widget _buildWidgets(BuildContext context) {
    return WidgetScaffold(
      appBar: WidgetAppBar(
        tr("COMPANION:ABOUT"),
        context: context,
      ),
      children: [
        _buildAbout(),
        ..._listLanguage(),
        ..._listDonation(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) => _buildWidgets(context);
}
