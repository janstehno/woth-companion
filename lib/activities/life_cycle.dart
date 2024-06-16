import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wothcompanion/helpers/filter.dart';
import 'package:wothcompanion/helpers/json.dart';
import 'package:wothcompanion/model/connect/animal_cycle.dart';
import 'package:wothcompanion/model/translatables/animal.dart';
import 'package:wothcompanion/model/translatables/reserve.dart';
import 'package:wothcompanion/widgets/app/bar_app.dart';
import 'package:wothcompanion/widgets/app/scaffold.dart';
import 'package:wothcompanion/widgets/handling/drop_down.dart';
import 'package:wothcompanion/widgets/handling/drop_down_item.dart';
import 'package:wothcompanion/widgets/parts/life_cycle/life_cycle.dart';
import 'package:wothcompanion/widgets/title/title.dart';
import 'package:wothcompanion/widgets/title/title_sub.dart';

class ActivityLifeCycle extends StatefulWidget {
  const ActivityLifeCycle({
    super.key,
  });

  @override
  ActivityLifeCycleState createState() => ActivityLifeCycleState();
}

class ActivityLifeCycleState extends State<ActivityLifeCycle> {
  final TextEditingController controller = TextEditingController();
  final List<AnimalCycle> _animalsCycles = [];

  late final List<Reserve> _reserves;

  int _reserveIndex = 0;

  @override
  void initState() {
    _reserves = HelperJSON.reserves.sorted(Reserve.sortByName);
    controller.addListener(() => _filter());
    super.initState();
  }

  void _filter() {
    setState(() {
      _animalsCycles.clear();
      _animalsCycles.addAll(HelperFilter.filterAnimalsCycles(controller.text, _reserves.elementAt(_reserveIndex).id)
          .sorted(AnimalCycle.sortByTierName));
    });
  }

  DropdownMenuItem _buildDropDownMenuItem(int value, String text) {
    return DropdownMenuItem(
      value: value,
      child: WidgetDropDownItem(
        text: text,
        value: value,
      ),
    );
  }

  List<DropdownMenuItem> _buildDropDownReserves() {
    return _reserves.map((e) => _buildDropDownMenuItem(_reserves.indexOf(e), e.name)).toList();
  }

  List<Widget> _listReserve() {
    return [
      WidgetTitle(tr("COMPANION:RESERVES")),
      WidgetDropDown(
        value: _reserveIndex,
        items: _buildDropDownReserves(),
        onChange: (dynamic value) => setState(() => _reserveIndex = value),
      ),
    ];
  }

  List<Widget> _listLifeCycles(List<AnimalCycle> animalsCycles) {
    int tier = 0;
    return animalsCycles.map((cycle) {
      Animal animal = HelperJSON.getAnimal(cycle.animal);
      bool showTitle = tier < animal.tier;
      tier = tier < animal.tier ? animal.tier : tier;
      return Column(
        children: [
          if (showTitle) WidgetSubtitle("${tr("UI:TIER")} ${animal.tier}"),
          WidgetLifeCycle(
            index: animalsCycles.indexOf(cycle),
            animalCycle: cycle,
          )
        ],
      );
    }).toList();
  }

  List<Widget> _listLifeCycle() {
    _filter();
    return [
      WidgetTitle(tr("UI:LIFE_CYCLE")),
      ..._listLifeCycles(_animalsCycles),
    ];
  }

  Widget _buildWidgets() {
    return WidgetScaffold(
      appBar: WidgetAppBar(
        tr("UI:LIFE_CYCLE"),
        context: context,
      ),
      searchController: controller,
      children: [
        ..._listReserve(),
        ..._listLifeCycle(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) => _buildWidgets();
}
