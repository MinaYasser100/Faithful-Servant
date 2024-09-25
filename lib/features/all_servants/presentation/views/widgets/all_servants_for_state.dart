import 'package:faithful_servant/features/all_servants/presentation/views/widgets/all_servants_body_for_stage.dart';
import 'package:flutter/material.dart';

class AllServantsForStage extends StatelessWidget {
  const AllServantsForStage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const AllServantsBodyForStage(),
    );
  }
}
