import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wothcompanion/activities/home.dart';
import 'package:wothcompanion/builders/builder.dart';
import 'package:wothcompanion/helpers/json.dart';
import 'package:wothcompanion/model/connect/animal_cycle.dart';
import 'package:wothcompanion/model/connect/animal_habitat.dart';
import 'package:wothcompanion/model/connect/animal_reserve.dart';
import 'package:wothcompanion/model/translatables/animal.dart';
import 'package:wothcompanion/model/translatables/firearm.dart';
import 'package:wothcompanion/model/translatables/habitat.dart';
import 'package:wothcompanion/model/translatables/reserve.dart';

class BuilderHome extends BuilderBuilder {
  const BuilderHome({
    super.key,
  }) : super("H");

  @override
  State<StatefulWidget> createState() => BuilderHomeState();
}

class BuilderHomeState extends BuilderBuilderState {
  @override
  void initializeData(AsyncSnapshot<Map<String, dynamic>> snapshot, BuildContext context) {
    Set<Reserve> reserves = snapshot.data!["reserves"] ?? [];
    Set<Animal> animals = snapshot.data!["animals"] ?? [];
    Set<AnimalHabitat> animalsHabitats = snapshot.data!["animalsHabitats"] ?? [];
    Set<AnimalReserve> animalsReserves = snapshot.data!["animalsReserves"] ?? [];
    Set<AnimalCycle> animalsCycles = snapshot.data!["animalsCycles"] ?? [];
    Set<Habitat> habitats = snapshot.data!["habitats"] ?? [];
    Set<Firearm> firearms = snapshot.data!["firearms"] ?? [];
    HelperJSON.setup(reserves, animals, animalsHabitats, animalsReserves, animalsCycles, habitats, firearms);
  }

  @override
  Future<Map<String, dynamic>> loadData() async {
    Set<Reserve> reserves = await HelperJSON.readReserves();
    updateProgress("reserves", reserves);
    Set<Animal> animals = await HelperJSON.readAnimals();
    updateProgress("animals", animals);
    Set<AnimalHabitat> animalsHabitats = await HelperJSON.readAnimalsHabitats();
    updateProgress("animalsHabitats", animalsHabitats);
    Set<AnimalReserve> animalsReserves = await HelperJSON.readAnimalsReserves();
    updateProgress("animalsReserves", animalsReserves);
    Set<AnimalCycle> animalsCycles = await HelperJSON.readAnimalsCycles();
    updateProgress("animalsCycles", animalsCycles);
    Set<Habitat> habitats = await HelperJSON.readHabitats();
    updateProgress("habitats", habitats);
    Set<Firearm> firearms = await HelperJSON.readFirearms();
    updateProgress("firearms", firearms);

    await Future.delayed(const Duration(seconds: 1), () {});
    return loadedData;
  }

  @override
  buildFutureWidget(BuildContext context) => const ActivityHome();
}

/*Set<Reserve> reserves = snapshot.data!.elementAt(0);
*/
