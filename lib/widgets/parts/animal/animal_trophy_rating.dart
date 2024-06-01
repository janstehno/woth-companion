import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wothcompanion/generated/assets.gen.dart';
import 'package:wothcompanion/interface/interface.dart';

class WidgetAnimalTrophyRating extends StatelessWidget {
  final int _rating;
  final Color? _color;

  const WidgetAnimalTrophyRating({
    super.key,
    required int rating,
    Color? color,
  })  : _rating = rating,
        _color = color;

  Color get _actualColor => _color ?? Interface.primary;

  Widget _buildIcon(bool star) {
    return Container(
      width: 10,
      margin: const EdgeInsets.only(left: 4),
      child: SvgPicture.asset(
        star ? Assets.graphics.shapes.star : Assets.graphics.shapes.dot,
        width: star ? 10 : 4,
        colorFilter: ColorFilter.mode(_actualColor.withOpacity(star ? 1 : 0.6), BlendMode.srcIn),
      ),
    );
  }

  Widget _buildWidgets() {
    return Row(
      children: [
        _buildIcon(_rating > 0),
        _buildIcon(_rating > 1),
        _buildIcon(_rating > 2),
        _buildIcon(_rating > 3),
        _buildIcon(_rating > 4),
      ],
    );
  }

  @override
  Widget build(BuildContext context) => _buildWidgets();
}
