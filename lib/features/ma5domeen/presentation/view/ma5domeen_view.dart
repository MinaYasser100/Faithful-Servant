import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/helper/get_pages.dart';
import 'package:faithful_servant/core/helper/styles.dart';
import 'package:faithful_servant/core/widgets/design_body.dart';
import 'package:faithful_servant/features/ma5domeen/presentation/manager/ma5domeen_cubit.dart';
import 'package:faithful_servant/features/ma5domeen/presentation/view/widgets/ma5domeen_widgets/ma5domeen_body.dart';
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
        backgroundColor: kPrimaryColor,
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          foregroundColor: kSecondColor,
          leading: IconButton(
            onPressed: () {
              Get.offAndToNamed(GetPages.selectStageview);
            },
            icon: const Icon(
              Icons.arrow_back_rounded,
            ),
          ),
          title: Text(
            namestage,
            style: Styles.textStyle25SecondColor,
          ),
          actions: [
            IconButton(
              onPressed: () {
                Get.toNamed(GetPages.kMa5domeenSearchView);
              },
              icon: const Icon(
                Icons.search_rounded,
                size: 30,
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed(GetPages.addMa5domeenview, arguments: namestage);
          },
          backgroundColor: kPrimaryLightColor,
          child: const Icon(Icons.add),
        ),
        body: DesignBody(
            widget: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Ma5domeenBody(
            nameStage: namestage,
          ),
        )),
      ),
    );
  }
}
