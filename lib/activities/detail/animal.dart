import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:wothcompanion/interface/graphics.dart';
import 'package:wothcompanion/interface/interface.dart';
import 'package:wothcompanion/interface/style.dart';
import 'package:wothcompanion/lists/detail_animal/animal_firearms.dart';
import 'package:wothcompanion/lists/detail_animal/animal_habitats.dart';
import 'package:wothcompanion/lists/detail_animal/animal_life_cycle.dart';
import 'package:wothcompanion/lists/detail_animal/animal_trophy_rating.dart';
import 'package:wothcompanion/miscellaneous/enums.dart';
import 'package:wothcompanion/model/translatables/animal.dart';
import 'package:wothcompanion/widgets/app/bar_app.dart';
import 'package:wothcompanion/widgets/app/divider.dart';
import 'package:wothcompanion/widgets/app/margin.dart';
import 'package:wothcompanion/widgets/app/padding.dart';
import 'package:wothcompanion/widgets/app/scaffold.dart';
import 'package:wothcompanion/widgets/text/text.dart';
import 'package:wothcompanion/widgets/title/title.dart';

class DetailAnimal extends StatelessWidget {
  final Animal _animal;

  const DetailAnimal({
    super.key,
    required Animal animal,
  }) : _animal = animal;

  Widget _buildSpace() {
    return const SizedBox(height: 3);
  }

  Widget _buildImage() {
    return SizedBox(
      height: 110,
      child: WidgetMargin.right(
        30,
        child: SimpleShadow(
          sigma: 0,
          child: Stack(
            children: [
              SvgPicture.asset(
                Graphics.getAnimal(_animal.id, MarkerType.fill),
                fit: BoxFit.fitHeight,
                colorFilter: const ColorFilter.mode(Interface.primaryLight, BlendMode.srcIn),
              ),
              SvgPicture.asset(
                Graphics.getAnimal(_animal.id, MarkerType.border),
                fit: BoxFit.fitHeight,
                colorFilter: const ColorFilter.mode(Interface.primaryDark, BlendMode.srcIn),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildName() {
    return Container(
      height: 110,
      alignment: Alignment.centerLeft,
      child: WidgetPadding.a30(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WidgetText(
              _animal.name.toUpperCase(),
              color: Interface.primary,
              style: Style.condensed.s22.w400,
            ),
            _buildSpace(),
            WidgetText(
              _animal.latin,
              color: Interface.disabled,
              style: Style.normal.s12.w400i,
            ),
          ],
        ),
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
            _animal.tier.toString(),
            color: Interface.primaryLight,
            style: Style.normal.s16.w400,
          ),
        ],
      ),
    );
  }

  Widget _buildRecommendedHitEnergy() {
    return WidgetPadding.fromLTRB(
      30,
      15,
      30,
      0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WidgetText(
            tr("UI:OPTIMAL_ENERGY").toUpperCase(),
            color: Interface.disabled,
            style: Style.condensed.s18.w300,
          ),
          _buildSpace(),
          WidgetText(
            "${_animal.min} - ${_animal.max}",
            color: Interface.primaryLight,
            style: Style.normal.s16.w400,
          )
        ],
      ),
    );
  }

  Widget _buildHabitats() {
    return WidgetPadding.fromLTRB(
      30,
      15,
      30,
      30,
      child: ListAnimalHabitats(_animal),
    );
  }

  List<Widget> _listTrophyRating() {
    return [
      WidgetTitle(tr("UI:TROPHY_RATING").toUpperCase()),
      WidgetPadding.a30(child: ListAnimalTrophyRating(_animal)),
    ];
  }

  List<Widget> _listLifeCycle() {
    return [
      WidgetTitle(tr("UI:LIFE_CYCLE")),
      WidgetPadding.h30(child: ListAnimalLifeCycle(_animal)),
    ];
  }

  List<Widget> _listRecommendedFirearms() {
    return [
      WidgetTitle(tr("COMPANION:RECOMMENDED_FIREARMS").toUpperCase()),
      WidgetPadding.a30(child: ListAnimalFirearms(_animal)),
    ];
  }

  Widget _buildWidgets(BuildContext context) {
    return WidgetScaffold(
      appBar: WidgetAppBar(
        tr("UI:SECTION_ANIMALS"),
        context: context,
      ),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: _buildName()),
            _buildImage(),
          ],
        ),
        const WidgetDivider(),
        _buildHuntingTier(),
        _buildRecommendedHitEnergy(),
        _buildHabitats(),
        ..._listTrophyRating(),
        ..._listLifeCycle(),
        ..._listRecommendedFirearms(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) => _buildWidgets(context);
}
