import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/widgets/Drawer/drawer.dart';
import 'package:faithful_servant/core/widgets/appbar.dart';
import 'package:faithful_servant/features/personal/presentation/views/widgets/history_body.dart';
import 'package:flutter/material.dart';

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
    );
  }
}
