import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:wothcompanion/activities/detail/animal.dart';
import 'package:wothcompanion/activities/list/items.dart';
import 'package:wothcompanion/helpers/filter.dart';
import 'package:wothcompanion/model/translatables/animal.dart';
import 'package:wothcompanion/widgets/parts/animal/animal.dart';

class ListAnimals extends ListItems {
  const ListAnimals({
    super.key,
  }) : super("UI:SECTION_ANIMALS");

  @override
  ListAnimalsState createState() => ListAnimalsState();
}

class ListAnimalsState extends ListItemsState<Animal> {
  @override
  List<Animal> get items => HelperFilter.filterAnimals(controller.text).sorted(Animal.sortByName);

  @override
  void onTap(Animal item) {
    Navigator.push(context, MaterialPageRoute(builder: (e) => DetailAnimal(animal: item)));
  }

  @override
  WidgetAnimal buildEntry(int index, Animal item) {
    return WidgetAnimal(
      index: index,
      entry: item,
      onTap: () {
        focus();
        onTap(item);
      },
    );
  }
}
