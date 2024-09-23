import 'package:faithful_servant/core/function/get_user_data.dart';
import 'package:faithful_servant/core/helper/get_pages.dart';
import 'package:faithful_servant/core/widgets/custom_text_button.dart';
import 'package:faithful_servant/features/ma5domeen/data/model/ma5domeen_model.dart';
import 'package:faithful_servant/features/register/data/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'ma5dom_info_widget.dart';
import 'servant_info_widget.dart';

class Ma5domeenDetailsBody extends StatefulWidget {
  const Ma5domeenDetailsBody(
      {super.key, required this.ma5domeenModel, required this.namestage});
  final Ma5domeenModel ma5domeenModel;
  final String namestage;

  @override
  State<Ma5domeenDetailsBody> createState() => _Ma5domeenDetailsBodyState();
}

class _Ma5domeenDetailsBodyState extends State<Ma5domeenDetailsBody> {
  late Future<UserModel?> userModelFuture;

  @override
  void initState() {
    userModelFuture = getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: userModelFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Show a loading spinner while waiting for the user model to load
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          // Handle error state
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData && snapshot.data != null) {
          // User model is loaded, now we can proceed
          final userModel = snapshot.data!;
          return Column(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Ma5damInfoWidget(ma5domeenModel: widget.ma5domeenModel),
                    ServantInfoWidget(ma5domeenModel: widget.ma5domeenModel),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              if (userModel.privilage != 'خادم')
                CustomTextButton(
                  textButton: 'Modifie Informaion'.tr,
                  onPressed: () {
                    Get.toNamed(GetPages.kEditMa5domeenDataView,
                        arguments: widget.ma5domeenModel);
                  },
                ),
            ],
          );
        } else {
          return const Center(child: Text('No user data available.'));
        }
      },
    );
  }
}
