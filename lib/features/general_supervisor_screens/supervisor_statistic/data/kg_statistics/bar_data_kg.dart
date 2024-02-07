import 'package:faithful_servant/features/general_supervisor_screens/supervisor_statistic/data/individual_bar.dart';

class BarDataKG {
  final int kg1;
  final int kg2;

  BarDataKG({
    required this.kg1,
    required this.kg2,
  });
  List<IndiviualBar> barDataKG = [];
  void initialzeBarData() {
    barDataKG = [
      IndiviualBar(x: 0, y: kg1),
      IndiviualBar(x: 1, y: kg2),
    ];
  }
}
