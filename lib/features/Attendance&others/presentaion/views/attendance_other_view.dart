import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/widgets/Drawer/drawer.dart';
import 'package:faithful_servant/core/widgets/appbar.dart';
import 'package:faithful_servant/features/Attendance&others/presentaion/views/widgets/attendance_and_other_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AttendanceAndOther extends StatelessWidget {
  const AttendanceAndOther({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: GeneralAppBar(title: 'Attendance & other'.tr, appBar: AppBar()),
      drawer: const GeneralDrawer(),
      body: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: kSecondColor,
              borderRadius: BorderRadius.circular(bodyRadious)),
          child: const AttendanceAndOtherBody()),
    );
  }
}
