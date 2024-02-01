import 'package:flutter/material.dart';

class GeneralDrawer extends StatelessWidget {
  final int privilege;
  const GeneralDrawer({super.key, required this.privilege});

  @override
  Widget build(BuildContext context) {
    return const Drawer(
      backgroundColor: Colors.white,
    );
  }
}
