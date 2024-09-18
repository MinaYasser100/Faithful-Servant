import 'package:faithful_servant/features/ma5domeen/presentation/manager/ma5domeen_cubit.dart';
import 'package:faithful_servant/features/ma5domeen/presentation/view/widgets/addMa5domeen_widgets/add_ma5domeen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class AddMa5domeenview extends StatelessWidget {
  const AddMa5domeenview({super.key});

  @override
  Widget build(BuildContext context) {
    String stageName = Get.arguments;
    return Scaffold(
      body: BlocProvider(
        create: (context) => Ma5domeenCubit(),
        child: Addma5domeenBody(
          namestage: stageName,
        ),
      ),
    );
  }
}
