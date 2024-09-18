// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ma5domeen_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class Ma5domeenModelAdapter extends TypeAdapter<Ma5domeenModel> {
  @override
  final int typeId = 2;

  @override
  Ma5domeenModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Ma5domeenModel(
      name: fields[1] as String,
      stagename: fields[9] as String,
      adderName:fields[2] as String,
      registerDate: fields[5] as String,
      updateRegisterDate: fields[6] as String,
      id: fields[7] as String,
      church: fields[8] as String,
      address: fields[12] as String,
      qualification: fields[13] as String,
      fatherOfConfession: fields[15] as String,
      birthDate: fields[10] as String,
      phoneNumber1: fields[3] as String,
      phoneNumber2: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Ma5domeenModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.adderName)
      ..writeByte(3)
      ..write(obj.phoneNumber1)
      ..writeByte(4)
      ..write(obj.phoneNumber2)
      ..writeByte(5)
      ..write(obj.registerDate)
      ..writeByte(6)
      ..write(obj.updateRegisterDate)
      ..writeByte(7)
      ..write(obj.id)
      ..writeByte(8)
      ..write(obj.church)
      ..writeByte(9)
      ..write(obj.stagename)
      ..writeByte(10)
      ..write(obj.birthDate)
      ..writeByte(12)
      ..write(obj.address)
      ..writeByte(13)
      ..write(obj.qualification)
      ..writeByte(15)
      ..write(obj.fatherOfConfession);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Ma5domeenModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
