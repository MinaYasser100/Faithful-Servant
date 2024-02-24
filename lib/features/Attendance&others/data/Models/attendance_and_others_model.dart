class AttendanceAndOthersModel {
  int? attendance;
  int? preparing;
  int? visites;

  AttendanceAndOthersModel({this.attendance, this.preparing, this.visites});

  factory AttendanceAndOthersModel.fromJson(Map<String, dynamic> json) {
    return AttendanceAndOthersModel(
      attendance: json['attendance'] as int?,
      preparing: json['preparing'] as int?,
      visites: json['visites'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'attendance': attendance,
        'preparing': preparing,
        'visites': visites,
      };
}
