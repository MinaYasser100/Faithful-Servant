import 'package:faithful_servant/core/helper/styles.dart';
import 'package:flutter/material.dart';

class ServantViewBody extends StatelessWidget {
  const ServantViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          'Servant View',
          style: Styles.textStyle30,
        ),
      ],
    );
  }
}
