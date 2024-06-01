import 'package:wothcompanion/helpers/json.dart';
import 'package:wothcompanion/model/connect/animal_cycle.dart';
import 'package:wothcompanion/model/translatables/animal.dart';
import 'package:wothcompanion/model/translatables/firearm.dart';
import 'package:wothcompanion/model/translatables/reserve.dart';

class HelperFilter {
  static Set<Reserve> filterReserves(String text) {
    if (text.isNotEmpty) {
      return HelperJSON.reserves.where((e) => e.name.toLowerCase().contains(text.toLowerCase())).toSet();
    }
    return HelperJSON.reserves;
  }

  static Set<Animal> filterAnimals(String text) {
    if (text.isNotEmpty) {
      return HelperJSON.animals.where((e) => e.name.toLowerCase().contains(text.toLowerCase())).toSet();
    }
    return HelperJSON.animals;
  }

  static Set<Firearm> filterFirearms(String text) {
    if (text.isNotEmpty) {
      return HelperJSON.firearms.where((e) => e.name.toLowerCase().contains(text.toLowerCase())).toSet();
    }
    return HelperJSON.firearms;
  }

  static Set<AnimalCycle> filterAnimalsCycles(String text, String reserveId) {
    if (text.isNotEmpty) {
      return HelperJSON.getAnimalCyclesForReserve(reserveId)
          .where((e) => HelperJSON.getAnimal(e.animal).name.toLowerCase().contains(text.toLowerCase()))
          .toSet();
    }
    return HelperJSON.getAnimalCyclesForReserve(reserveId).toSet();
  }
}
