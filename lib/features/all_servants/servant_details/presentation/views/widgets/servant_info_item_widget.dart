import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/helper/styles.dart';
import 'package:flutter/material.dart';

class ServantInfoItemWidget extends StatelessWidget {
  const ServantInfoItemWidget({
    super.key,
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$title :',
          style: Styles.textStyle18.copyWith(color: kPrimaryColor),
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Icon(
                Icons.circle,
                size: 10,
                color: Colors.grey,
              ),
            ),
            Expanded(
              child: Text(
                value,
                style:
                    Styles.textStyle16.copyWith(fontWeight: FontWeight.normal),
              ),
            )
          ],
        ),
      ],
    );
  }
}
