class DataPathsToPdf {
  //Data Model For pathing to pdf
  final String name;
  final String service;
  final int malecount;
  final int femalecount;
  final String date;
  final String churchName;
  final String role;
  final String statisticTitle;

  DataPathsToPdf({
    required this.role,
    required this.name,
    required this.service,
    required this.malecount,
    required this.femalecount,
    required this.date,
    required this.churchName,
    required this.statisticTitle,
  });
}
