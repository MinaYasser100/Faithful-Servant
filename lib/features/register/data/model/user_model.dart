import 'package:hive/hive.dart';
part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel extends HiveObject {
  @HiveField(0)
  final String userID;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String email;
  @HiveField(3)
  final String phoneNum1;
  @HiveField(4)
  final String phoneNum2;
  @HiveField(5)
  final String image;
  @HiveField(6)
  final String nationalId;
  @HiveField(7)
  final String privilage;
  @HiveField(8)
  final String church;
  @HiveField(9)
  final String gender;
  @HiveField(10)
  final String numberOfnumber;
  @HiveField(11)
  final String streetName;
  @HiveField(12)
  final String addressOfArea;
  @HiveField(13)
  final String qualification;
  @HiveField(14)
  final String currentService;
  @HiveField(15)
  final String fatherOfConfession;
  @HiveField(16)
  final String brithDate;

  UserModel(
      {required this.userID,
      required this.name,
      required this.email,
      required this.phoneNum1,
      required this.phoneNum2,
      required this.image,
      required this.nationalId,
      required this.privilage,
      required this.church,
      required this.gender,
      required this.numberOfnumber,
      required this.streetName,
      required this.addressOfArea,
      required this.qualification,
      required this.currentService,
      required this.fatherOfConfession,
      required this.brithDate});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userID: json['userID'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      phoneNum1: json['phoneNum1'] as String,
      phoneNum2: json['phoneNum2'] as String,
      image: json['image'] as String,
      nationalId: json['nationalId'] as String,
      privilage: json['privilage'] as String,
      church: json['church'] as String,
      gender: json['gender'] as String,
      numberOfnumber: json['numberOfnumber'] as String,
      streetName: json['streetName'] as String,
      addressOfArea: json['addressOfArea'] as String,
      qualification: json['qualification'] as String,
      currentService: json['currentService'] as String,
      fatherOfConfession: json['fatherOfConfession'] as String,
      brithDate: json['brithDate'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userID': userID,
      'name': name,
      'email': email,
      'phoneNum1': phoneNum1,
      'phoneNum2': phoneNum2,
      'image': image,
      'nationalId': nationalId,
      'privilage': privilage,
      'church': church,
      'gender': gender,
      'numberOfnumber': numberOfnumber,
      'streetName': streetName,
      'addressOfArea': addressOfArea,
      'qualification': qualification,
      'currentService': currentService,
      'fatherOfConfession': fatherOfConfession,
      'brithDate': brithDate,
    };
  }
}
