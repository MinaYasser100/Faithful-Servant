import 'package:hive/hive.dart';

part 'ma5domeen_model.g.dart';
@HiveType(typeId: 2)
class Ma5domeenModel extends HiveObject {

  @HiveField(1)
  final String name;
  @HiveField(2)
  final String adderName;
  @HiveField(3)
  final String phoneNumber1;
  @HiveField(4)
  final String phoneNumber2;
  @HiveField(5)
  final String registerDate;
  @HiveField(6)
  final String updateRegisterDate;
  @HiveField(7)
  final String id;
  @HiveField(8)
  final String church;
  @HiveField(9)
  final String stagename;
  @HiveField(10)
  final String birthDate;
  @HiveField(12)
  final String address;
  @HiveField(13)
  final String qualification;
  @HiveField(15)
  final String fatherOfConfession;
 

  Ma5domeenModel(
      {
      required this.name,
      required this.stagename,
      required this.registerDate,
      required this.updateRegisterDate,
      required this.id,
      required this.adderName,
      required this.church,
      required this.address,
      required this.qualification,
      required this.fatherOfConfession,
      required this.birthDate,
      required this.phoneNumber1,
      required this.phoneNumber2});

  factory Ma5domeenModel.fromJson(Map<String, dynamic> json) {
    return Ma5domeenModel(
      name: json['name'] as String,
      stagename: json['stagename'] as String,
      id: json['id'] as String,
      registerDate: json['registerDate'] as String,
      updateRegisterDate: json['updateRegisterDate'] as String,
      adderName: json['adderName'] as String,
      phoneNumber1: json['phoneNumber1'] as String,
      phoneNumber2: json['phoneNumber2'] as String,
      church: json['church'] as String,
      address: json['address'] as String,
      qualification: json['qualification'] as String,
      fatherOfConfession: json['fatherOfConfession'] as String,
      birthDate: json['birthDate'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'stagename':stagename,
      'adderName':adderName,
      'updateRegisterDate':updateRegisterDate,
      'registerDate':registerDate,
      'phoneNumber1': phoneNumber1,
      'phoneNumber2': phoneNumber2,
      'church': church,
      'address': address,
      'qualification': qualification,
      'fatherOfConfession': fatherOfConfession,
      'birthDate': birthDate,
      'id':id,
    };
  }
}
