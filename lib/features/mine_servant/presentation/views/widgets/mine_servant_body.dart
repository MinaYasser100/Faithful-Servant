import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/helper/test_data.dart';
import 'package:faithful_servant/features/mine_servant/presentation/views/widgets/search_field.dart';
import 'package:faithful_servant/features/mine_servant/presentation/views/widgets/servant_list.dart';
import 'package:flutter/material.dart';

class MineServantBody extends StatelessWidget {
  const MineServantBody({super.key});

  @override
  Widget build(BuildContext context) {
    Testdb dbClass = Testdb();
    List FilteredList;
    if (dbClass.me['privilege'] == 'امين خدمة') {
      // the current user is امين خدمة
      FilteredList = dbClass.db
          .where((i) =>
              i['privilege'] == 'خادم' &&
              i['current_service'] == dbClass.me['current_service'] &&
              i['name'] != dbClass.me['name'])
          .toList();
    } else {
      // the current user is مشرف عام
      FilteredList = dbClass.db
          .where((i) =>
              i['name'] != dbClass.me['name'] && i['privilege'] != 'مشرف عام')
          .toList();
    }

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: kSecondColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(bodyRadious),
          topRight: Radius.circular(bodyRadious),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SearchField(),
          const SizedBox(height: 10),
          ServantList(filteredList: FilteredList),
        ],
      ),
    );
  }
}
