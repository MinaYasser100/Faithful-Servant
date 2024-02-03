import 'package:flutter/material.dart';
import 'register_view_body_constent.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNum1Controller = TextEditingController();
  TextEditingController phoneNum2Controller = TextEditingController();
  TextEditingController nationalIDController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController qualificationController = TextEditingController();
  TextEditingController numberOfHomeController = TextEditingController();
  TextEditingController streetNameController = TextEditingController();
  TextEditingController addressOfAreaController = TextEditingController();
  TextEditingController fatherOfConfessionController = TextEditingController();
  GlobalKey<FormState> fromKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ReisterViewBodyContent(
          fromKey: fromKey,
          nameController: nameController,
          emailController: emailController,
          phoneNum1Controller: phoneNum1Controller,
          phoneNum2Controller: phoneNum2Controller,
          nationalIDController: nationalIDController,
          passwordController: passwordController,
          confirmPasswordController: confirmPasswordController,
          numberOfHomeController: numberOfHomeController,
          fatherOfConfessionController: fatherOfConfessionController,
          qualificationController: qualificationController,
          streetNameController: streetNameController,
          addressOfAreaController: addressOfAreaController,
        ),
      ),
    );
  }
}
