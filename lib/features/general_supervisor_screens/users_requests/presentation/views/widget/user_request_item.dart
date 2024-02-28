import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/helper/styles.dart';
import 'package:flutter/material.dart';

import 'custom_button_in_item.dart';

class UserRequestItem extends StatelessWidget {
  const UserRequestItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: const Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          children: [
            Expanded(
              child: Text(
                'مينا ياسر شكير شاكر',
                style: Styles.textStyle22SecondColor,
              ),
            ),
            CustomButtonInItem(),
          ],
        ),
      ),
    );
  }
}
