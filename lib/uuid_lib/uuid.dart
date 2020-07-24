import 'package:uuid/uuid.dart' as lib;

class Uuid {

  String newUuid() {
    final uuid = lib.Uuid();
    return uuid.v4();
  }

}