import 'package:faithful_servant/features/general_manager/presentation/views/widgets/general_manager_body.dart';
import 'package:flutter/material.dart';

class GeneralManager extends StatelessWidget {
  const GeneralManager({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: GeneralManagerBody(),
    );
  }
}
