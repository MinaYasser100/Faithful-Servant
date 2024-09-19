import 'package:faithful_servant/features/ma5domeen/data/model/ma5domeen_model.dart';
import 'package:faithful_servant/features/ma5domeen/presentation/manager/ma5domeen_cubit.dart';
import 'package:faithful_servant/features/ma5domeen/presentation/view/widgets/edit_ma5domeen_widgets/edit_ma5domeen_data_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class EditMa5domeenDataView extends StatelessWidget {
  const EditMa5domeenDataView({super.key});

  @override
  Widget build(BuildContext context) {
    Ma5domeenModel ma5domeenModel = Get.arguments;
    return Scaffold(
      body: BlocProvider(
        create: (context) => Ma5domeenCubit(),
        child: EditMa5domeenDataBody(
          ma5domeenModel: ma5domeenModel,
        ),
      ),
    );
  }
}
