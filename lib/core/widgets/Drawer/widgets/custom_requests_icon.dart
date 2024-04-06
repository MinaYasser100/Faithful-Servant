import 'package:faithful_servant/core/helper/constant.dart';
import 'package:flutter/material.dart';

class CustomRequestsIcon extends StatelessWidget {
  const CustomRequestsIcon({
    super.key,
    required this.numberOfUsers,
  });
  final String numberOfUsers;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: IconTheme.of(context).color,
      radius: 13,
      child: Text(
        numberOfUsers,
        style: const TextStyle(
          color: kSecondColor,
        ),
      ),
    );
  }
}
