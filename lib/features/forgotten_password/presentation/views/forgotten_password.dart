import 'package:faithful_servant/features/forgotten_password/presentation/views/widgets/forgotten_password_view_body.dart';
import 'package:flutter/material.dart';

class ForgottenPasswordView extends StatelessWidget {
  const ForgottenPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: ForgottenPasswordViewBody(),
      ),
    );
  }
}
