import 'dart:core';

import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wothcompanion/helpers/json.dart';
import 'package:wothcompanion/miscellaneous/enums.dart';
import 'package:wothcompanion/miscellaneous/values.dart';
import 'package:wothcompanion/model/exportables/exportable.dart';

class CustomLocation extends Exportable {
  final String _id;
  Color _color;
  String _description;
  Set<dynamic> _animals;

  CustomLocation({
    required String id,
    required Color color,
    required String? description,
    required Set<dynamic>? animals,
  })  : _id = id,
        _color = color,
        _description = description ?? "",
        _animals = animals ?? {};

  String get id => _id;

  Color get color => _color;

  String? get description => _description;

  Set<CustomLocationAnimal> get animals => _animals.cast<CustomLocationAnimal>();

  void setDescription(String text) => _description = text;

  void setColor(Color color) => _color = color;

  void setAnimals(Set<CustomLocationAnimal> animals) => _animals = animals;

  static CustomLocation create(String id, Color color, String description, Set<CustomLocationAnimal> animals) {
    return CustomLocation(
      id: id,
      color: color,
      description: description,
      animals: animals,
    );
  }

  factory CustomLocation.fromJson(Map<String, dynamic> json) {
    return CustomLocation(
      id: json['ID'],
      color: Values.colors.firstWhereOrNull((e) => e.value == json['COLOR']) ?? Values.colors.first,
      description: json['DESCRIPTION'],
      animals: (json['ANIMALS'] ?? []).map((e) => CustomLocationAnimal.fromJson(e)).toSet(),
    );
  }

  @override
  String toString() {
    return '''{
      "ID":"$_id",
      "COLOR":${_color.value},
      ${_description.isNotEmpty ? '"DESCRIPTION":"$_description",' : ""}
      ${_animals.isNotEmpty ? '"ANIMALS":${HelperJSON.listToJson(_animals)}' : ""}
    }''';
  }
}

class CustomLocationAnimal extends Exportable {
  final AgeType _age;
  final int _trophyRating;

  CustomLocationAnimal({
    required AgeType age,
    required int trophyRating,
  })  : _age = age,
        _trophyRating = trophyRating;

  String get gender => _trophyRating == 0 ? tr("ANIMAL:GENDER_FEMALE") : tr("ANIMAL:GENDER_MALE");

  String get age => tr("ANIMAL:AGE_${_age.name.toUpperCase()}");

  int get trophyRating => _trophyRating;

  static CustomLocationAnimal create(String id, AgeType age, int trophyRating) {
    return CustomLocationAnimal(
      age: age,
      trophyRating: trophyRating,
    );
  }

  factory CustomLocationAnimal.fromJson(Map<String, dynamic> json) {
    return CustomLocationAnimal(
      age: AgeType.values.elementAt(json['AGE']),
      trophyRating: json['TROPHY_RATING'],
    );
  }

  @override
  String toString() {
    return '''{
      "AGE":${_age.index},
      "TROPHY_RATING":$_trophyRating
    }''';
  }
}
