import 'package:flutter/material.dart';
import 'forgotten_password_app_bar.dart';

class ForgottenPasswordViewBody extends StatelessWidget {
  const ForgottenPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ForgottenPasswordAppBar(),
      ],
    );
  }
}
