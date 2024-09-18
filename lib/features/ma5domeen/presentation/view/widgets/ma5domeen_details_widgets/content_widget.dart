import 'package:flutter/material.dart';

class Content extends StatelessWidget {
  final String title;
  final String data;

  const Content({super.key, required this.title, required this.data});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        Flexible(
          child: Text(data,
              style: const TextStyle(fontSize: 17),
              overflow: TextOverflow.visible),
        )
      ],
    );
  }
}
