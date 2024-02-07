import '../individual_bar.dart';

class BarDataAdults {
  final int students;
  final int graduates;
  final int people;
  final int men;
  BarDataAdults({
    required this.students,
    required this.graduates,
    required this.people,
    required this.men,
  });
  List<IndiviualBar> barDataAdults = [];
  void initialzeBarData() {
    barDataAdults = [
      IndiviualBar(x: 0, y: students),
      IndiviualBar(x: 1, y: graduates),
      IndiviualBar(x: 2, y: people),
      IndiviualBar(x: 3, y: men),
    ];
  }
}
