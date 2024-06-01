import 'package:wothcompanion/model/translatables/translatable.dart';

class Habitat extends Translatable {
  Habitat({
    required super.id,
  });

  factory Habitat.fromJson(Map<String, dynamic> json) {
    return Habitat(
      id: json["ID"],
    );
  }
}
