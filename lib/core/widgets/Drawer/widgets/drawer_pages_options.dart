import 'package:faithful_servant/core/widgets/Drawer/function/determined_pages_options.dart';
import 'package:faithful_servant/features/register/data/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerPagesOptions extends StatelessWidget {
  const DrawerPagesOptions({
    super.key,
    required this.userModel,
  });
  final UserModel userModel;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: ListView.builder(
          itemCount: determinedPagesOptions(userModel: userModel).length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                Get.back();
                Get.toNamed(determinedPagesOptions(userModel: userModel)[index]
                    ['routeto']);
              },
              title: Text(
                  determinedPagesOptions(userModel: userModel)[index]['text']),
              leading: Icon(
                  determinedPagesOptions(userModel: userModel)[index]['icon']),
            );
          },
        ),
      ),
    );
  }
}
