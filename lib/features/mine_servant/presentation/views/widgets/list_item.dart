import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/helper/styles.dart';
import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  const ListItem({
    super.key,
    required this.dbData,
    required this.index,
  });

  final List dbData;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(40),
          ),
          child: ListTile(
            onTap: () {
              print(dbData[index]['privilege']);
            },
            title: Text(
              dbData[index]['name'],
              style: Styles.textStyle16SecondColor,
            ),
            subtitle: Row(
              children: [
                Text(dbData[index]['current_role'],
                    style: Styles.textStyle13SecondColor),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Text('/', style: Styles.textStyle13SecondColor),
                ),
                Text(dbData[index]['current_service'],
                    style: Styles.textStyle13SecondColor),
              ],
            ),
            leading: const CircleAvatar(
              radius: 25,
              backgroundColor: kPrimaryColor,
              backgroundImage: AssetImage('assets/images/jesus.jpeg'),
            ),
          ),
        ),
        const SizedBox(height: 5)
      ],
    );
  }
}
