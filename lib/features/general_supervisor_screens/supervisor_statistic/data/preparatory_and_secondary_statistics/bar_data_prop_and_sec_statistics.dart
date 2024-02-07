import '../individual_bar.dart';

class BarDataPreparatoryAndSecondary {
  final int pro1;
  final int pro2;
  final int sec1;
  final int sec2;

  BarDataPreparatoryAndSecondary({
    required this.sec1,
    required this.sec2,
    required this.pro1,
    required this.pro2,
  });
  List<IndiviualBar> barDataKG = [];
  void initialzeBarData() {
    barDataKG = [
      IndiviualBar(x: 0, y: sec1),
      IndiviualBar(x: 1, y: sec2),
      IndiviualBar(x: 2, y: pro1),
      IndiviualBar(x: 3, y: pro2),
    ];
  }
}
