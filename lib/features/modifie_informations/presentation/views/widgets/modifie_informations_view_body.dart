import 'package:faithful_servant/features/register/data/model/user_model.dart';
import 'package:flutter/material.dart';

class ModifieInformationsViewBody extends StatefulWidget {
  const ModifieInformationsViewBody({super.key, required this.userModel});
  final UserModel userModel;
  @override
  State<ModifieInformationsViewBody> createState() =>
      _ModifieInformationsViewBodyState();
}

class _ModifieInformationsViewBodyState
    extends State<ModifieInformationsViewBody> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNum1Controller = TextEditingController();
  TextEditingController phoneNum2Controller = TextEditingController();
  TextEditingController nationalIDController = TextEditingController();
  TextEditingController qualificationController = TextEditingController();
  TextEditingController numberOfHomeController = TextEditingController();
  TextEditingController streetNameController = TextEditingController();
  TextEditingController addressOfAreaController = TextEditingController();
  TextEditingController fatherOfConfessionController = TextEditingController();
  GlobalKey<FormState> fromKey = GlobalKey();
  @override
  void initState() {
    nameController.text = widget.userModel.name;
    emailController.text = widget.userModel.email;
    phoneNum1Controller.text = widget.userModel.phoneNum1;
    phoneNum2Controller.text = widget.userModel.phoneNum2;
    nationalIDController.text = widget.userModel.nationalId;
    qualificationController.text = widget.userModel.qualification;
    numberOfHomeController.text = widget.userModel.numberOfnumber;
    streetNameController.text = widget.userModel.streetName;
    addressOfAreaController.text = widget.userModel.addressOfArea;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [],
    );
  }
}
