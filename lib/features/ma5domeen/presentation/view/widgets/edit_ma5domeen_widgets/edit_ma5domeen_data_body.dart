import 'package:faithful_servant/features/ma5domeen/data/model/ma5domeen_model.dart';
import 'package:faithful_servant/features/ma5domeen/presentation/view/widgets/edit_ma5domeen_widgets/edit_ma5domeen_view_body_content.dart';
import 'package:flutter/material.dart';

class EditMa5domeenDataBody extends StatefulWidget {
  const EditMa5domeenDataBody({super.key, required this.ma5domeenModel});

  final Ma5domeenModel ma5domeenModel;

  @override
  State<EditMa5domeenDataBody> createState() => _EditMa5domeenDataBody();
}

class _EditMa5domeenDataBody extends State<EditMa5domeenDataBody> {
  late TextEditingController nameController;
  late TextEditingController phoneNumber1Controller;
  late TextEditingController phoneNumber2Controller;
  late TextEditingController qualificationController;
  late TextEditingController addressController;
  late TextEditingController fatherOfConfessionController;
  late TextEditingController dateController;

  GlobalKey<FormState> fromKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    // Initialize controllers with values from the model
    nameController = TextEditingController(text: widget.ma5domeenModel.name);
    phoneNumber1Controller =
        TextEditingController(text: widget.ma5domeenModel.phoneNumber1);
    phoneNumber2Controller =
        TextEditingController(text: widget.ma5domeenModel.phoneNumber2);
    qualificationController =
        TextEditingController(text: widget.ma5domeenModel.qualification);
    addressController =
        TextEditingController(text: widget.ma5domeenModel.address);
    fatherOfConfessionController =
        TextEditingController(text: widget.ma5domeenModel.fatherOfConfession);
    dateController =
        TextEditingController(text: widget.ma5domeenModel.birthDate);
  }

  @override
  void dispose() {
    // Dispose of all controllers
    nameController.dispose();
    phoneNumber1Controller.dispose();
    phoneNumber2Controller.dispose();
    qualificationController.dispose();
    addressController.dispose();
    fatherOfConfessionController.dispose();
    dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: EditMa5domeenViewBodyContent(
        fromKey: fromKey,
        nameController: nameController,
        phoneNumber1Controller: phoneNumber1Controller,
        phoneNumber2Controller: phoneNumber2Controller,
        fatherOfConfessionController: fatherOfConfessionController,
        qualificationController: qualificationController,
        addressController: addressController,
        dateController: dateController,
        ma5domeenModel: widget.ma5domeenModel,
      ),
    );
  }
}
