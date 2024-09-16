import 'package:faithful_servant/features/ma5domeen/presentation/view/widgets/addMa5domeen_widgets/addMa5domeenViewBody_content.dart';
import 'package:flutter/material.dart';

class Addma5domeenBody extends StatefulWidget {
  const Addma5domeenBody({super.key});

  @override
  State<Addma5domeenBody> createState() => _Addma5domeenBody();
}

class _Addma5domeenBody extends State<Addma5domeenBody> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumber1Controller = TextEditingController();
  TextEditingController phoneNumber2Controller = TextEditingController();
  TextEditingController qualificationController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController fatherOfConfessionController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  GlobalKey<FormState> fromKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Addma5domeenviewbodyContent(
          fromKey: fromKey,
          nameController: nameController,
          phoneNumber1Controller: phoneNumber1Controller,
          phoneNumber2Controller: phoneNumber2Controller,
          fatherOfConfessionController: fatherOfConfessionController,
          qualificationController: qualificationController,
          addressController: addressController,
          dateController: dateController,
        ),
      ),
    );
  }
}
