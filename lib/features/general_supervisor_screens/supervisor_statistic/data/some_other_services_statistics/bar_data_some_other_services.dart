import '../individual_bar.dart';

class BarDataSomeOtherServices {
  final int corals;
  final int festivalCoordinators;
  final int scouts;
  final int counselingCentre;
  final int deaconsSchool;

  BarDataSomeOtherServices({
    required this.corals,
    required this.festivalCoordinators,
    required this.scouts,
    required this.counselingCentre,
    required this.deaconsSchool,
  });
  List<IndiviualBar> barDataSomeOtherServices = [];
  void initialzeBarData() {
    barDataSomeOtherServices = [
      IndiviualBar(x: 0, y: corals),
      IndiviualBar(x: 1, y: festivalCoordinators),
      IndiviualBar(x: 2, y: scouts),
      IndiviualBar(x: 3, y: counselingCentre),
      IndiviualBar(x: 4, y: deaconsSchool),
    ];
  }
}
