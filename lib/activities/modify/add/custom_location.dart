import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wothcompanion/activities/modify/modify.dart';
import 'package:wothcompanion/generated/assets.gen.dart';
import 'package:wothcompanion/helpers/map.dart';
import 'package:wothcompanion/interface/interface.dart';
import 'package:wothcompanion/interface/values.dart';
import 'package:wothcompanion/miscellaneous/enums.dart';
import 'package:wothcompanion/model/exportables/custom_location.dart';
import 'package:wothcompanion/widgets/app/margin.dart';
import 'package:wothcompanion/widgets/app/padding.dart';
import 'package:wothcompanion/widgets/button/button_icon.dart';
import 'package:wothcompanion/widgets/button/button_text.dart';
import 'package:wothcompanion/widgets/parts/modify/custom_location_animal.dart';
import 'package:wothcompanion/widgets/text/text_field.dart';
import 'package:wothcompanion/widgets/title/title_sub.dart';

class ActivityAddCustomLocation extends ActivityModify {
  final String _id;
  final HelperMap _helperMap;

  const ActivityAddCustomLocation({
    super.key,
    required String id,
    required HelperMap helperMap,
    required super.onSuccess,
  })  : _id = id,
        _helperMap = helperMap,
        super(name: "UI:CUSTOM");

  String get id => _id;

  HelperMap get helperMap => _helperMap;

  @override
  State<StatefulWidget> createState() => ActivityAddCustomLocationState();
}

class ActivityAddCustomLocationState extends ActivityModifyState {
  final TextEditingController textController = TextEditingController();

  HelperMap get helperMap => (widget as ActivityAddCustomLocation).helperMap;

  AgeType selectedAge = AgeType.young;
  int selectedTrophyRating = 0;

  Color color = Values.colors.first;
  Set<CustomLocationAnimal> animals = {};

  CustomLocation get _newCustomLocation {
    return CustomLocation(
      id: (widget as ActivityAddCustomLocation).id,
      color: color,
      description: textController.text.isEmpty ? null : textController.text,
      animals: animals,
    );
  }

  void onSuccess() {
    helperMap.save(_newCustomLocation);
  }

  @override
  void onConfirm() {
    onSuccess();
    widget.onSuccess();
    Navigator.pop(context);
  }

  Widget _buildColor(double width, Color color, bool chosen) {
    return WidgetButtonIcon(
      Assets.graphics.icons.check,
      width: width,
      color: chosen ? Interface.primaryDark : Interface.transparent,
      background: color,
      onTap: () {
        setState(() {
          this.color = color;
        });
      },
    );
  }

  List<Widget> _listColor() {
    double screenWidth = MediaQuery.of(context).size.width;
    double width = (screenWidth - 60 - (7 * 10)) / 8;
    return [
      WidgetSubtitle(tr("COMPANION:COLOR")),
      WidgetPadding.h30v20(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: Values.colors.map((e) => _buildColor(width, e, e == color)).toList(),
        ),
      ),
    ];
  }

  Widget _buildAge(AgeType age, bool chosen) {
    return WidgetMargin.right(
      10,
      child: WidgetButtonText(
        tr("ANIMAL:AGE_${age.name.toUpperCase()}"),
        color: chosen ? Interface.primaryDark : Interface.primaryLight.withOpacity(0.6),
        background: chosen ? Interface.primary : Interface.gradientGreen,
        onTap: () {
          setState(() {
            selectedAge = age;
          });
        },
      ),
    );
  }

  Widget _buildTrophyRating(int trophyRating, bool chosen) {
    return WidgetButtonIcon(
      Assets.graphics.shapes.star,
      color: chosen ? Interface.primary : Interface.disabled,
      background: Interface.transparent,
      onTap: () {
        setState(() {
          if (selectedTrophyRating == trophyRating) {
            selectedTrophyRating = 0;
            return;
          }
          selectedTrophyRating = trophyRating;
        });
      },
    );
  }

  List<Widget> _listTrophyRating() {
    return List.generate(5, (i) => i).map((e) => _buildTrophyRating(e + 1, e + 1 <= selectedTrophyRating)).toList();
  }

  Widget _buildAgeOption() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: AgeType.values.map((e) => _buildAge(e, e == selectedAge)).toList(),
    );
  }

  Widget _buildTrophyRatingOption() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: _listTrophyRating(),
    );
  }

  Widget _buildOptions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildAgeOption(),
        const SizedBox(height: 10),
        _buildTrophyRatingOption(),
      ],
    );
  }

  Widget _buildAnimal(CustomLocationAnimal animal, double partWidth) {
    return GestureDetector(
      onDoubleTap: () => setState(() => animals.remove(animal)),
      child: WidgetPadding.v(5, child: WidgetCustomLocationAnimal(animal: animal, width: partWidth)),
    );
  }

  Widget _buildAddButton() {
    return WidgetButtonIcon(
      Assets.graphics.icons.check,
      onTap: () => setState(
        () => animals.add(
          CustomLocationAnimal(
            age: selectedAge,
            trophyRating: selectedTrophyRating,
          ),
        ),
      ),
    );
  }

  Widget _buildOptionsAndAdd() {
    return WidgetPadding.h30v20(
      background: Interface.subtitle.withOpacity(0.4),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _buildOptions(),
              _buildAddButton(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAnimals() {
    double screenWidth = MediaQuery.of(context).size.width;
    double partWidth = (screenWidth - 60) / 3;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: animals.isEmpty ? 0 : 20),
      child: Column(children: animals.map((e) => _buildAnimal(e, partWidth)).toList()),
    );
  }

  List<Widget> _listCustomLocationAnimals() {
    return [
      WidgetSubtitle(tr("UI:SECTION_ANIMALS")),
      _buildOptionsAndAdd(),
      _buildAnimals(),
    ];
  }

  List<Widget> _listDescription() {
    return [
      WidgetSubtitle(tr("COMPANION:DESCRIPTION")),
      WidgetPadding.h30v20(
        child: WidgetTextField(
          maxLines: 7,
          controller: textController,
        ),
      ),
    ];
  }

  @override
  List<Widget> buildBody() {
    return [
      ..._listColor(),
      ..._listCustomLocationAnimals(),
      ..._listDescription(),
    ];
  }
}
