import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/widgets/Drawer/drawer.dart';
import 'package:faithful_servant/core/widgets/appbar.dart';
import 'package:faithful_servant/features/personal/data/repos/services_history_repo_implementation.dart';
import 'package:faithful_servant/features/personal/presentation/manager/history_of_service_cubit/history_of_service_cubit.dart';
import 'package:faithful_servant/features/personal/presentation/views/widgets/bottom_sheet_of_adding_service_history.dart';
import 'package:faithful_servant/features/personal/presentation/views/widgets/history_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: GeneralAppBar(title: 'تاريخي الخدمي', appBar: AppBar()),
      drawer: const GeneralDrawer(),
      body: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: kSecondColor,
            borderRadius: BorderRadius.circular(bodyRadious),
          ),
          child: const HistoryBody()),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return BlocProvider(
                create: (context) =>
                    HistoryOfServiceCubit(ServiceHistoryImplementaion()),
                child: const BottomSheetOfAddingServiceHistory(),
              );
            },
          );
        },
        child: const Icon(
          Icons.add,
          color: kSecondColor,
          size: 30,
        ),
      ),
    );
  }
}
