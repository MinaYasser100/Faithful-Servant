import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/helper/styles.dart';
import 'package:flutter/material.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Text(
                          'الخدمة: ',
                          style: Styles.textStyle16
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          'اولي ابتدائي',
                          style: Styles.textStyle16,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'المدة : ',
                          style: Styles.textStyle16
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          '5 سنوات',
                          style: Styles.textStyle16,
                        )
                      ],
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'المكان : ',
                      style: Styles.textStyle16
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      'كنيسة مارجرجس والانبا بيشوي',
                      style: Styles.textStyle16,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        IconButton(
            color: kPrimaryColor,
            onPressed: () {},
            icon: const Icon(Icons.edit))
      ],
    );
  }
}
