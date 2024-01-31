class UserModel {
  final String userID;
  final String name;
  final String email;
  final String phone;
  final String image;
  final String nationalId;
  final String privilage;
  final String church;
  final String address;
  final String qualification;
  final String currentService;

  UserModel({
    required this.userID,
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
    required this.nationalId,
    required this.privilage,
    required this.church,
    required this.address,
    required this.qualification,
    required this.currentService,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userID: json['userID'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      image: json['image'] as String,
      nationalId: json['nationalId'] as String,
      privilage: json['privilage'] as String,
      church: json['church'] as String,
      address: json['address'] as String,
      qualification: json['qualification'] as String,
      currentService: json['currentService'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userID': userID,
      'name': name,
      'email': email,
      'phone': phone,
      'image': image,
      'nationalId': nationalId,
      'privilage': privilage,
      'church': church,
      'address': address,
      'qualification': qualification,
      'currentService': currentService,
    };
  }
}
