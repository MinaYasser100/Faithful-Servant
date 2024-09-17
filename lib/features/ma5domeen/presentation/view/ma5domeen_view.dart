import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/helper/get_pages.dart';
import 'package:faithful_servant/core/widgets/appbar.dart';
import 'package:faithful_servant/features/ma5domeen/presentation/manager/ma5domeen_cubit.dart';
import 'package:faithful_servant/features/ma5domeen/presentation/view/widgets/ma5domeen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class Ma5domeenView extends StatefulWidget {
  const Ma5domeenView({super.key});

  @override
  State<Ma5domeenView> createState() => _Ma5domeenView();
}

class _Ma5domeenView extends State<Ma5domeenView> {
  late String namestage;
  @override
  void initState() {
    namestage = Get.arguments;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Ma5domeenCubit()..gettingMa5domeenData(namestage),
      child: Scaffold(
        appBar: GeneralAppBar(title: namestage, appBar: AppBar()),
        body: Ma5domeenBody(
          nameStage: namestage,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed(GetPages.addMa5domeenview, arguments: namestage);
          },
          backgroundColor: kPrimaryLightColor,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
