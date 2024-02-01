import 'package:faithful_servant/core/helper/constant.dart';
import 'package:flutter/material.dart';

void customSnackBar(context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: kPrimaryLightColor,
      content: Row(
        children: [
          const Icon(
            Icons.check_circle_outline_outlined,
            color: kSecondColor,
            size: 40,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            child: Text(
              text,
              style: const TextStyle(
                color: kSecondColor,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    ),
  );
}
