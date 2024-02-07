import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/helper/styles.dart';
import 'package:flutter/material.dart';

class PersonalImageAndName extends StatelessWidget {
  const PersonalImageAndName(
      {super.key, required this.name, required this.url});

  final String name;
  final String url;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            const CircleAvatar(
              backgroundColor: kPrimaryLightColor,
              radius: 75,
            ),
            CircleAvatar(
              radius: 70,
              backgroundImage: NetworkImage(url),
            ),
          ],
        ),
        Text(name, style: Styles.textStyle20)
      ],
    );
  }
}
