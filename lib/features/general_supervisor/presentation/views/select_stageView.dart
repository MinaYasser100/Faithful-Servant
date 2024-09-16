import 'package:faithful_servant/core/widgets/appbar.dart';
import 'package:faithful_servant/features/general_supervisor/presentation/views/widgets/select_Stagebody.dart';
import 'package:flutter/material.dart';

class SelectStageview extends StatelessWidget {
  const SelectStageview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GeneralAppBar(title: "متابعه مخدومين", appBar: AppBar()),
      body: const SelectStagebody(),
    );
  }
  
}