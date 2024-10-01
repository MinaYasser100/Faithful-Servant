import 'package:flutter/material.dart';

Container deleteBackground() {
  return Container(
    decoration: BoxDecoration(
      color: Colors.red,
      borderRadius: BorderRadius.circular(5),
    ),
    alignment: Alignment.centerRight,
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: const Icon(
      Icons.delete,
      color: Colors.white,
    ),
  );
}
