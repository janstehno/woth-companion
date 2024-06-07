import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wothcompanion/interface/interface.dart';
import 'package:wothcompanion/widgets/app/bar_app.dart';
import 'package:wothcompanion/widgets/app/scaffold.dart';
import 'package:wothcompanion/widgets/title/title_tap.dart';

abstract class ActivityModify extends StatefulWidget {
  final String _name;
  final Function _onSuccess;

  const ActivityModify({
    super.key,
    required String name,
    required Function onSuccess,
  })  : _name = name,
        _onSuccess = onSuccess;

  String get name => _name;

  Function get onSuccess => _onSuccess;
}

abstract class ActivityModifyState extends State<ActivityModify> {
  void focus() {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  void onConfirm();

  List<Widget> buildBody();

  Widget _buildConfirm() {
    return WidgetTitleTap(
      tr("UI:CONFIRM"),
      color: Interface.primaryDark,
      background: Interface.primary,
      onTap: () => onConfirm(),
    );
  }

  Widget _buildWidgets() {
    return WidgetScaffold(
      appBar: WidgetAppBar(
        tr(widget.name),
        context: context,
      ),
      children: [
        ...buildBody(),
        _buildConfirm(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) => _buildWidgets();
}
