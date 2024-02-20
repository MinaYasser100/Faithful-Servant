// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserModelAdapter extends TypeAdapter<UserModel> {
  @override
  final int typeId = 0;

  @override
  UserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserModel(
      userID: fields[0] as String,
      name: fields[1] as String,
      email: fields[2] as String,
      phoneNum1: fields[3] as String,
      phoneNum2: fields[4] as String,
      image: fields[5] as String,
      nationalId: fields[6] as String,
      privilage: fields[7] as String,
      church: fields[8] as String,
      gender: fields[9] as String,
      numberOfnumber: fields[10] as String,
      streetName: fields[11] as String,
      addressOfArea: fields[12] as String,
      qualification: fields[13] as String,
      currentService: fields[14] as String,
      fatherOfConfession: fields[15] as String,
      brithDate: fields[16] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer
      ..writeByte(17)
      ..writeByte(0)
      ..write(obj.userID)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.phoneNum1)
      ..writeByte(4)
      ..write(obj.phoneNum2)
      ..writeByte(5)
      ..write(obj.image)
      ..writeByte(6)
      ..write(obj.nationalId)
      ..writeByte(7)
      ..write(obj.privilage)
      ..writeByte(8)
      ..write(obj.church)
      ..writeByte(9)
      ..write(obj.gender)
      ..writeByte(10)
      ..write(obj.numberOfnumber)
      ..writeByte(11)
      ..write(obj.streetName)
      ..writeByte(12)
      ..write(obj.addressOfArea)
      ..writeByte(13)
      ..write(obj.qualification)
      ..writeByte(14)
      ..write(obj.currentService)
      ..writeByte(15)
      ..write(obj.fatherOfConfession)
      ..writeByte(16)
      ..write(obj.brithDate);
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
