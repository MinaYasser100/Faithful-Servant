import 'package:flutter/material.dart';
import 'forgotten_password_app_bar.dart';
import 'forgotten_password_body_content.dart';

class ForgottenPasswordViewBody extends StatefulWidget {
  const ForgottenPasswordViewBody({super.key});

  @override
  State<ForgottenPasswordViewBody> createState() =>
      _ForgottenPasswordViewBodyState();
}

class _ForgottenPasswordViewBodyState extends State<ForgottenPasswordViewBody> {
  final TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey();
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const ForgottenPasswordAppBar(),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ForgottenPasswordBodyContent(
              emailController: emailController,
              formKey: formkey,
            ),
          ),
        ],
      ),
    );
  }
}
