import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart' as root_bundle;
import 'package:wothcompanion/generated/assets.gen.dart';
import 'package:wothcompanion/miscellaneous/enums.dart';
import 'package:wothcompanion/model/connect/animal_cycle.dart';
import 'package:wothcompanion/model/connect/animal_habitat.dart';
import 'package:wothcompanion/model/connect/animal_reserve.dart';
import 'package:wothcompanion/model/translatables/animal.dart';
import 'package:wothcompanion/model/translatables/firearm.dart';
import 'package:wothcompanion/model/translatables/habitat.dart';
import 'package:wothcompanion/model/translatables/reserve.dart';

class HelperJSON {
  static final Set<Reserve> reserves = {};
  static final Set<Animal> animals = {};
  static final Set<AnimalHabitat> animalsHabitats = {};
  static final Set<AnimalReserve> animalsReserves = {};
  static final Set<AnimalCycle> animalsCycles = {};
  static final Set<Habitat> habitats = {};
  static final Set<Firearm> firearms = {};

  static void setup(
    Set<Reserve> a,
    Set<Animal> b,
    Set<AnimalHabitat> c,
    Set<AnimalReserve> d,
    Set<AnimalCycle> e,
    Set<Habitat> f,
    Set<Firearm> g,
  ) {
    _clearLists();
    reserves.addAll(a);
    animals.addAll(b);
    animalsHabitats.addAll(c);
    animalsReserves.addAll(d);
    animalsCycles.addAll(e);
    habitats.addAll(f);
    firearms.addAll(g);
  }

  static void _clearLists() {
    reserves.clear();
    animals.clear();
    animalsHabitats.clear();
    animalsReserves.clear();
    animalsCycles.clear();
    habitats.clear();
    firearms.clear();
  }

  static Reserve getReserve(String id) {
    try {
      return reserves.firstWhere((e) => e.id == id);
    } catch (e) {
      throw Exception("Reserve with ID: $id does not exist");
    }
  }

  static Set<Animal> getReserveAnimals(String id) {
    return animals
        .where((animal) => animalsReserves.where((e) => e.reserve == id && e.animal == animal.id).isNotEmpty)
        .toSet();
  }

  static Animal getAnimal(String id) {
    try {
      return animals.firstWhere((e) => e.id == id);
    } catch (e) {
      throw Exception("Animal with ID: $id does not exist");
    }
  }

  static AnimalCycle getAnimalCycle(String animalId) {
    try {
      return animalsCycles.firstWhere((e) => e.animal == animalId);
    } catch (e) {
      throw Exception("Animal's cycle with animal ID: $animalId does not exist");
    }
  }

  static Set<AnimalHabitat> getAnimalHabitats(String animalId, HabitatType habitatType) {
    return animalsHabitats.where((e) => e.animal == animalId && e.type == habitatType).toSet();
  }

  static Set<AnimalReserve> getAnimalReserves(String animalId) {
    return animalsReserves.where((e) => e.animal == animalId).toSet();
  }

  static Set<AnimalCycle> getAnimalCyclesForReserve(String reserveId) {
    return animalsCycles
        .where((e) => animalsReserves.where((f) => f.animal == e.animal && f.reserve == reserveId).isNotEmpty)
        .toSet();
  }

  static Set<Firearm> getAnimalFirearms(String animalId) {
    Set<Firearm> animalFirearms = {};
    Animal animal = getAnimal(animalId);
    int minEnergy = animal.min;
    int maxEnergy = animal.max;
    for (Firearm firearm in firearms) {
      if (firearm.tier == 1) {
        animalFirearms.add(firearm);
        continue;
      }
      int count = 0;
      bool isIn = false;
      for (int energy in firearm.energy) {
        if (minEnergy <= energy && energy <= maxEnergy) {
          isIn = true;
          count++;
        }
      }
      if (isIn && count >= 3) animalFirearms.add(firearm);
    }
    return animalFirearms;
  }

  static Habitat getHabitat(String id) {
    try {
      return habitats.firstWhere((e) => e.id == id);
    } catch (e) {
      throw Exception("Habitat with ID: $id does not exist");
    }
  }

  static Firearm getFirearm(String id) {
    try {
      return firearms.firstWhere((e) => e.id == id);
    } catch (e) {
      throw Exception("Firearm with ID: $id does not exist");
    }
  }

  static Set<Animal> getFirearmAnimals(String firearmId) {
    Set<Animal> firearmAnimals = {};
    Firearm firearm = getFirearm(firearmId);
    if (firearm.tier == 1) return animals;
    for (Animal animal in animals) {
      int count = 0;
      bool isIn = false;
      for (int energy in firearm.energy) {
        if (animal.min - (animal.min * 0.1) <= energy && energy <= animal.max + (animal.max * 0.1)) {
          isIn = true;
          count++;
        }
      }
      if (isIn && count >= 3) firearmAnimals.add(animal);
    }
    return firearmAnimals;
  }

  static Future<String> getData(String name) async {
    final String content;
    content = await root_bundle.rootBundle.loadString(name);
    return content;
  }

  static Future<Set<Reserve>> readReserves() async {
    final data = await getData(Assets.raw.reserves);
    final list = json.decode(data) as List<dynamic>;
    return list.map((e) => Reserve.fromJson(e)).toSet();
  }

  static Future<Set<Animal>> readAnimals() async {
    final data = await getData(Assets.raw.animals);
    final list = json.decode(data) as List<dynamic>;
    return list.map((e) => Animal.fromJson(e)).toSet();
  }

  static Future<Set<AnimalHabitat>> readAnimalsHabitats() async {
    final data = await getData(Assets.raw.animalsHabitats);
    final list = json.decode(data) as List<dynamic>;
    return list.map((e) => AnimalHabitat.fromJson(e)).toSet();
  }

  static Future<Set<AnimalReserve>> readAnimalsReserves() async {
    final data = await getData(Assets.raw.animalsReserves);
    final list = json.decode(data) as List<dynamic>;
    return list.map((e) => AnimalReserve.fromJson(e)).toSet();
  }

  static Future<Set<AnimalCycle>> readAnimalsCycles() async {
    final data = await getData(Assets.raw.animalsCycles);
    final list = json.decode(data) as List<dynamic>;
    return list.map((e) => AnimalCycle.fromJson(e)).toSet();
  }

  static Future<Set<Habitat>> readHabitats() async {
    final data = await getData(Assets.raw.habitats);
    final list = json.decode(data) as List<dynamic>;
    return list.map((e) => Habitat.fromJson(e)).toSet();
  }

  static Future<Set<Firearm>> readFirearms() async {
    final data = await getData(Assets.raw.firearms);
    final list = json.decode(data) as List<dynamic>;
    return list.map((e) => Firearm.fromJson(e)).toSet();
  }

  static String listToJson(Set<dynamic> list) {
    String parsed = "[";
    int i = 0;
    for (dynamic item in list) {
      parsed += item.toString();
      if (i != list.length - 1) {
        parsed += ",";
      }
      i++;
    }
    parsed += "]";
    return parsed;
  }

  static Future<String> fileToJson(File file) async {
    try {
      final String contents;
      await file.exists() ? contents = await file.readAsString() : contents = "[]";
      if (contents.startsWith("[") && contents.endsWith("]")) return contents;
      return "[]";
    } catch (e) {
      return e.toString();
    }
  }
}
