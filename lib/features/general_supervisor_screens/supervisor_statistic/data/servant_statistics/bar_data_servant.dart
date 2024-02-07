import '../individual_bar.dart';

class BarDataServant {
  final int servant;
  final int sundayServants;
  final int prepareServants;

  BarDataServant({
    required this.servant,
    required this.sundayServants,
    required this.prepareServants,
  });
  List<IndiviualBar> barDataServant = [];
  void initialzeBarData() {
    barDataServant = [
      IndiviualBar(x: 0, y: servant),
      IndiviualBar(x: 1, y: sundayServants),
      IndiviualBar(x: 2, y: prepareServants),
    ];
  }
}
