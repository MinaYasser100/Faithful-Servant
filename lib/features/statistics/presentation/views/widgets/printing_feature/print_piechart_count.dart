import 'package:faithful_servant/core/helper/styles.dart';
import 'package:faithful_servant/features/statistics/presentation/views/functions/print_feature/piechart_count_print.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/helper/constant.dart';

class PrintingPieCountChart extends StatelessWidget {
  const PrintingPieCountChart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.black12, borderRadius: BorderRadius.circular(30)),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'طباعة البيانات ...',
                style: Styles.textStyle18,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(kPrimaryColor)),
                  onPressed: piechartCountPrint,
                  child: Text(
                    'Print',
                    style: Styles.textStyle16SecondColor,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
