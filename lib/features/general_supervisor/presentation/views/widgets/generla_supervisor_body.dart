import 'package:faithful_servant/core/helper/styles.dart';
import 'package:flutter/material.dart';

class GeneralSupervisorBody extends StatelessWidget {
  const GeneralSupervisorBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          'General Supervisor',
          style: Styles.textStyle30,
        ),
      ],
    );
  }
}
