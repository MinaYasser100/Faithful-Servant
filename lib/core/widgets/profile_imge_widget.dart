import 'package:faithful_servant/core/helper/constant.dart';
import 'package:flutter/material.dart';

class ProfileImageWidget extends StatelessWidget {
  const ProfileImageWidget({
    super.key,
    required this.backgroundImage,
    required this.onPressed,
  });
  final ImageProvider<Object> backgroundImage;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        CircleAvatar(
          radius: 58,
          backgroundColor: kPrimaryLightColor,
          child: CircleAvatar(
            radius: 55,
            backgroundImage: backgroundImage,
          ),
        ),
        CircleAvatar(
          child: IconButton(
            onPressed: onPressed,
            icon: const Icon(
              Icons.edit,
            ),
          ),
        )
      ],
    );
  }
}
