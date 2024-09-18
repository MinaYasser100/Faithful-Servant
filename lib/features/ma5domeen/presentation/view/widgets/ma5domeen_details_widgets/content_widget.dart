import 'package:faithful_servant/core/helper/constant.dart';
import 'package:flutter/material.dart';

class Content extends StatelessWidget {
  final String title;
  final String data;

  const Content({super.key, required this.title, required this.data});
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18,color: kPrimaryColor),
        ),
        Text(data,
            style: const TextStyle(fontSize: 17),
            overflow: TextOverflow.visible)
      ],
    );
  }
}
