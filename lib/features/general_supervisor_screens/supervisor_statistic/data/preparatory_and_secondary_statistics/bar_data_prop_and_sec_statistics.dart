import '../individual_bar.dart';

class BarDataPreparatoryAndSecondary {
  final int proGirls;
  final int proBoys;
  final int secGirls;
  final int secBoys;

  BarDataPreparatoryAndSecondary({
    required this.proGirls,
    required this.proBoys,
    required this.secGirls,
    required this.secBoys,
  });
  List<IndiviualBar> barDataKG = [];
  void initialzeBarData() {
    barDataKG = [
      IndiviualBar(x: 0, y: proGirls),
      IndiviualBar(x: 1, y: proBoys),
      IndiviualBar(x: 2, y: secGirls),
      IndiviualBar(x: 3, y: secBoys),
    ];
  }
}
