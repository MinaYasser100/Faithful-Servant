import 'package:faithful_servant/core/helper/styles.dart';
import 'package:flutter/material.dart';

class NumberOfServants extends StatelessWidget {
  const NumberOfServants({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Center(
            child: Column(
              children: [
                Text('عدد الخدام بالخدمة',
                    style: Styles.textStyle16SecondColor),
                Text('30', style: Styles.textStyle30SecondColor),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
