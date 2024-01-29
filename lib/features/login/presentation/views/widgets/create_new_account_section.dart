import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/helper/styles.dart';
import 'package:flutter/material.dart';

class CreateNewAccountSection extends StatelessWidget {
  const CreateNewAccountSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.arrow_forward_ios_outlined,
          color: kDarkSecondColor,
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            'Create New Acount',
            style: Styles.textStyle18,
          ),
        ),
        const Icon(
          Icons.arrow_back_ios_outlined,
          color: kDarkSecondColor,
        ),
      ],
    );
  }
}
