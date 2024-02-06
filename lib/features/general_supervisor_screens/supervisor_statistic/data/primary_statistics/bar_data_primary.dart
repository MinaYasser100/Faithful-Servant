import 'package:faithful_servant/features/general_supervisor_screens/supervisor_statistic/data/individual_bar.dart';

class BarDataPrimary {
  final int primary1;
  final int primary2;
  final int primary3;
  final int primary4;
  final int primary5;
  final int primary6;

  BarDataPrimary({
    required this.primary1,
    required this.primary2,
    required this.primary3,
    required this.primary4,
    required this.primary5,
    required this.primary6,
  });

  List<IndiviualBar> barDataPrimary = [];

  void initialzeBarData() {
    barDataPrimary = [
      IndiviualBar(x: 0, y: primary1),
      IndiviualBar(x: 1, y: primary2),
      IndiviualBar(x: 2, y: primary3),
      IndiviualBar(x: 3, y: primary4),
      IndiviualBar(x: 4, y: primary5),
      IndiviualBar(x: 5, y: primary6),
    ];
  }
}
