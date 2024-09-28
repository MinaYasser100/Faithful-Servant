import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/widgets/Drawer/drawer.dart';
import 'package:faithful_servant/features/notification/presentation/manager/cubit/notification_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/appbar.dart';
import 'widgets/notification_body.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotificationCubit(),
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        appBar: GeneralAppBar(title: 'الاشعارات', appBar: AppBar()),
        drawer: const GeneralDrawer(),
        body: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: kSecondColor,
            borderRadius: BorderRadius.circular(bodyRadious),
          ),
          child: const NotificationBody(),
        ),
      ),
    );
  }
}
