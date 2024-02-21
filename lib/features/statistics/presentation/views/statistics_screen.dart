import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/widgets/Drawer/drawer.dart';
import 'package:faithful_servant/core/widgets/appbar.dart';
import 'package:faithful_servant/features/statistics/presentation/manager/pie_chart_gender_count_cubit/pie_chart_cubit.dart';
import 'package:faithful_servant/features/statistics/presentation/views/widgets/general_manager_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class Statistics extends StatelessWidget {
  const Statistics({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PieChartCubit()..getingDataFromFirebase(),
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        appBar: GeneralAppBar(title: 'Statistics'.tr, appBar: AppBar()),
        body: Container(
            decoration: BoxDecoration(
              color: kSecondColor,
              borderRadius: BorderRadius.circular(bodyRadious),
            ),
            child: const GeneralManagerViewBody()),
        drawer: const GeneralDrawer(),
      ),
    );
  }
}
