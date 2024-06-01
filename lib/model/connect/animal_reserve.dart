class AnimalReserve {
  final String _animal;
  final String _reserve;

  AnimalReserve({
    required String animal,
    required String reserve,
  })  : _animal = animal,
        _reserve = reserve;

  String get animal => _animal;

  String get reserve => _reserve;

  factory AnimalReserve.fromJson(Map<String, dynamic> json) {
    return AnimalReserve(
      animal: json["ANIMAL"],
      reserve: json["RESERVE"],
    );
  }
}
