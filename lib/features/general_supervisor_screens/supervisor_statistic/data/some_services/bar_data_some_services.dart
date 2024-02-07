import '../individual_bar.dart';

class BarDataSomeServices {
  final int mothoerDulaji;
  final int wisdoms;
  final int stage;
  final int demonstrationTools;
  final int brothersOfLord;

  BarDataSomeServices({
    required this.mothoerDulaji,
    required this.wisdoms,
    required this.stage,
    required this.demonstrationTools,
    required this.brothersOfLord,
  });
  List<IndiviualBar> barDataSomeServices = [];
  void initialzeBarData() {
    barDataSomeServices = [
      IndiviualBar(x: 0, y: mothoerDulaji),
      IndiviualBar(x: 1, y: wisdoms),
      IndiviualBar(x: 2, y: stage),
      IndiviualBar(x: 3, y: demonstrationTools),
      IndiviualBar(x: 4, y: brothersOfLord),
    ];
  }
}
