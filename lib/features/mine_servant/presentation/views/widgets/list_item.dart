import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/helper/get_pages.dart';
import 'package:faithful_servant/core/helper/styles.dart';
import 'package:faithful_servant/features/register/data/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListItem extends StatelessWidget {
  const ListItem({
    super.key,
    required this.dbData,
    required this.index,
  });

  final List<UserModel> dbData;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(40), // Card border radius
            side: const BorderSide(
              color: kPrimaryColor,
              width: 1.2,
            ),
          ),
          elevation: 4,
          child: ListTile(
            onTap: () {
              //open full data
              Get.toNamed(GetPages.kUserInformationsView,
                  arguments: {"personal": false, "id": dbData[index].userID});
            },
            title: Text(
              dbData[index].name,
              style: Styles.textStyle18,
            ),
            subtitle: Row(
              children: [
                Text(
                  dbData[index].currentService,
                  style: Styles.textStyle13SecondColor
                      .copyWith(color: Colors.grey[800]),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Text('/',
                      style: Styles.textStyle13SecondColor
                          .copyWith(color: Colors.grey[800])),
                ),
              ],
            ),
            leading: CircleAvatar(
              radius: 26,
              backgroundColor: kPrimaryColor,
              child: CircleAvatar(
                radius: 25,
                backgroundColor: kPrimaryColor,
                backgroundImage: NetworkImage(dbData[index].image),
              ),
            ),
          ),
        ),
        const SizedBox(height: 5)
      ],
    );
  }
}
