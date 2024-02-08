class History {
  final double duration;
  final String place;
  final String services;
  final String role;

  History(
      {required this.duration,
      required this.place,
      required this.services,
      required this.role});

  factory History.fromJson(Map<String, dynamic> json) {
    return History(
      duration: json['duration'] as double,
      place: json['place'] as String,
      services: json['services'] as String,
      role: json['role'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'duration': duration,
      'place': place,
      'services': services,
      'role': role,
    };
  }
}
