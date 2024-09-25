import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/helper/styles.dart';
import 'package:faithful_servant/core/widgets/design_body.dart';
import 'package:faithful_servant/features/all_servants/data/repo/all_servants_repo_implement.dart';
import 'package:faithful_servant/features/all_servants/presentation/manager/all_servants_cubit.dart';
import 'package:faithful_servant/features/all_servants/presentation/views/widgets/all_servants_body_for_stage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class AllServantsForStage extends StatelessWidget {
  const AllServantsForStage({super.key});

  @override
  Widget build(BuildContext context) {
    final currentService = Get.arguments as String;
    return BlocProvider(
      create: (context) => AllServantsCubit(AllServantsRepoImplement())
        ..getAllServantForStage(currentService: currentService),
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          foregroundColor: kSecondColor,
          title: Text(
            currentService,
            style: Styles.textStyle25SecondColor,
          ),
        ),
        body: DesignBody(
          widget: AllServantsBodyForStage(
            currentService: currentService,
          ),
        ),
      ),
    );
  }
}
