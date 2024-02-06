import 'package:faithful_servant/core/helper/styles.dart';
import 'package:faithful_servant/features/statistics/presentation/views/widgets/pie_gender_chart.dart';
import 'package:flutter/material.dart';

class GeneralManagerViewBody extends StatelessWidget {
  const GeneralManagerViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'إحصائيات خدام المرحلة:',
            style: Styles.textStyle20,
          ),
          SizedBox(width: 300, height: 300, child: PieGenderChart()),
        ],
      ),
    );
  }
}
