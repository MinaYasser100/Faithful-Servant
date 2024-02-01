class UserModel {
  final String userID;
  final String name;
  final String email;
  final String phoneNum1;
  final String phoneNum2;
  final String image;
  final String nationalId;
  final String privilage;
  final String church;
  final String numberOfnumber;
  final String streetName;
  final String addressOfArea;
  final String qualification;
  final String currentService;

  UserModel({
    required this.userID,
    required this.name,
    required this.email,
    required this.phoneNum1,
    required this.phoneNum2,
    required this.image,
    required this.nationalId,
    required this.privilage,
    required this.church,
    required this.numberOfnumber,
    required this.streetName,
    required this.addressOfArea,
    required this.qualification,
    required this.currentService,
  });

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
      numberOfnumber: json['numberOfnumber'] as String,
      streetName: json['streetName'] as String,
      addressOfArea: json['addressOfArea'] as String,
      qualification: json['qualification'] as String,
      currentService: json['currentService'] as String,
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
      'numberOfnumber': numberOfnumber,
      'streetName': streetName,
      'addressOfArea': addressOfArea,
      'qualification': qualification,
      'currentService': currentService,
    };
  }
}
