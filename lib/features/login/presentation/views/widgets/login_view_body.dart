import 'package:flutter/material.dart';
import 'login_view_body_constent.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> fromkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: LoginViewBodyContent(
          emailController: emailController,
          passwordController: passwordController,
          fromkey: fromkey,
        ),
      ),
    );
  }
}
