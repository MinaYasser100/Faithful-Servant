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
  TextEditingController phoneController = TextEditingController();
  TextEditingController nationalIDController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController qualificationController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController fatherOfConfessionController = TextEditingController();
  TextEditingController currentServiceController = TextEditingController();
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
          phoneController: phoneController,
          nationalIDController: nationalIDController,
          passwordController: passwordController,
          confirmPasswordController: confirmPasswordController,
          addressController: addressController,
          currentServiceController: currentServiceController,
          fatherOfConfessionController: fatherOfConfessionController,
          qualificationController: qualificationController,
        ),
      ),
    );
  }
}
