class Workout {
  final String _name;
  final String _uuid;

  Workout(this._name, this._uuid);

  String get name => _name;

  String get uuid => _uuid;

  Workout copyWith({String name, String uuid}) {
    return Workout(
      name == null? _name: name,
      uuid == null? _uuid: uuid
    );
  }
}
