class ServiceHistoryModel {
  final String service;
  final String role;
  final String duration;
  final String place;

  const ServiceHistoryModel(
      {required this.duration,
      required this.place,
      required this.role,
      required this.service});

  factory ServiceHistoryModel.fromJson(Map<String, dynamic> json) {
    return ServiceHistoryModel(
      service: json['service'] as String,
      role: json['role'] as String,
      place: json['place'] as String,
      duration: json['duration'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'service': service,
      'role': role,
      'place': place,
      'duration': duration,
    };
  }
}
