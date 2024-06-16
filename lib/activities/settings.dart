import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wothcompanion/interface/settings.dart';
import 'package:wothcompanion/widgets/app/bar_app.dart';
import 'package:wothcompanion/widgets/app/scaffold.dart';
import 'package:wothcompanion/widgets/handling/drop_down.dart';
import 'package:wothcompanion/widgets/handling/drop_down_item.dart';
import 'package:wothcompanion/widgets/section/section_tap_align.dart';
import 'package:wothcompanion/widgets/title/title.dart';

class ActivitySettings extends StatefulWidget {
  final Function _callback;

  const ActivitySettings({
    super.key,
    required Function callback,
  }) : _callback = callback;

  Function get callback => _callback;

  @override
  ActivitySettingsState createState() => ActivitySettingsState();
}

class ActivitySettingsState extends State<ActivitySettings> {
  Settings get _settings => Provider.of<Settings>(context, listen: false);

  DropdownMenuItem _buildDropdownItem(String language) {
    return WidgetDropDownItem(
      text: _settings.getLocaleName(_settings.languages.indexOf(language)),
      value: _settings.languages.indexOf(language),
    );
  }

  List<DropdownMenuItem> _listLanguages() {
    return _settings.languages.map((e) => _buildDropdownItem(e)).toList();
  }

  List<Widget> _listLanguage() {
    return [
      WidgetTitle(tr("UI:LANGUAGE")),
      WidgetDropDown(
        value: _settings.language,
        items: _listLanguages(),
        onChange: (dynamic value) {
          setState(() {
            _settings.changeLanguage(value);
            EasyLocalization.of(context)!.setLocale(_settings.getLocale(value));
            widget.callback();
          });
        },
      ),
    ];
  }

  Widget _buildUnitsMetric() {
    return WidgetSectionTapAlign(
      tr("COMPANION:UNITS_METRIC"),
      indicatorRight: false,
      active: !(_settings.imperialUnits),
      onTap: () {
        setState(() {
          _settings.changeUnits(false);
        });
      },
    );
  }

  Widget _buildUnitsImperials() {
    return WidgetSectionTapAlign(
      tr("COMPANION:UNITS_IMPERIAL"),
      active: _settings.imperialUnits,
      onTap: () {
        setState(() {
          _settings.changeUnits(true);
        });
      },
    );
  }

  List<Widget> _listUnits() {
    return [
      WidgetTitle(tr("COMPANION:UNITS")),
      Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: _buildUnitsMetric()),
          Expanded(child: _buildUnitsImperials()),
        ],
      )
    ];
  }

  Widget _buildWidgets() {
    return WidgetScaffold(
      appBar: WidgetAppBar(
        tr("UI:SETTINGS"),
        context: context,
      ),
      children: [
        ..._listLanguage(),
        ..._listUnits(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) => _buildWidgets();
}
