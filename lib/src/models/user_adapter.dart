import 'package:don/src/models/user_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class UserAdapter extends TypeAdapter<User> {
  @override
  User read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User(
      pk: fields[0] as int,
      username: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.pk)
      ..writeByte(1)
      ..write(obj.username);
  }

  @override
  int get typeId => 1;
}