import 'package:faithful_servant/core/helper/assets.dart';
import 'package:flutter/material.dart';

class ProfileImageWidget extends StatelessWidget {
  const ProfileImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        CircleAvatar(
          radius: 55,
          backgroundImage: AssetImage(Assets.jesusAndYourSon),
        ),
        CircleAvatar(
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.edit,
            ),
          ),
        )
      ],
    );
  }
}
