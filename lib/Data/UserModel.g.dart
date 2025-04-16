// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserModelAdapter extends TypeAdapter<UserModel> {
  @override
  final int typeId = 1;

  @override
  UserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserModel(
      favoritesWord: (fields[1] as List?)?.cast<WordModel>(),
      showWords: (fields[2] as List?)?.cast<WordModel>(),
      studyDays: (fields[3] as List?)?.cast<String>(),
      seenWords: (fields[4] as List?)?.cast<WordModel>(),
    )..userLevel = fields[0] as int;
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.userLevel)
      ..writeByte(1)
      ..write(obj.favoritesWord)
      ..writeByte(2)
      ..write(obj.showWords)
      ..writeByte(3)
      ..write(obj.studyDays)
      ..writeByte(4)
      ..write(obj.seenWords);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
