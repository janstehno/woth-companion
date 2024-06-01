import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wothcompanion/model/translatables/translatable.dart';
import 'package:wothcompanion/widgets/app/bar_app.dart';
import 'package:wothcompanion/widgets/app/scaffold.dart';

abstract class ListItems extends StatefulWidget {
  final String _title;

  const ListItems(
    String title, {
    super.key,
  }) : _title = title;

  String get title => _title;
}

abstract class ListItemsState<I extends Translatable> extends State<ListItems> {
  final TextEditingController controller = TextEditingController();

  List<I> _filteredItems = [];

  List<I> get items;

  @override
  void initState() {
    controller.addListener(() => _filter());
    super.initState();
  }

  void _filter() {
    setState(() {
      _filteredItems = items;
    });
  }

  void focus() {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  void onTap(I item);

  Widget buildEntry(int index, I item);

  List<Widget> _listEntries() {
    if (_filteredItems.isEmpty) _filter();
    return _filteredItems.mapIndexed((i, e) => buildEntry(i, e)).toList();
  }

  Widget _buildWidgets() {
    return WidgetScaffold(
      appBar: WidgetAppBar(
        tr(widget.title),
        context: context,
      ),
      searchController: controller,
      children: _listEntries(),
    );
  }

  @override
  Widget build(BuildContext context) => _buildWidgets();
}
