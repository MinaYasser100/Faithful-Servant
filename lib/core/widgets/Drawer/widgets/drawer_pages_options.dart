import 'package:faithful_servant/core/helper/cache_helper.dart';
import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/helper/get_pages.dart';
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
        child: Column(
          children: [
            ListTile(
              onTap: () async {
                String value = await CacheHelper.getData(key: kHomeView);
                Get.offAllNamed(value);
              },
              title: const Text('الصفحة الرئيسية'),
              leading: const Icon(Icons.home_rounded),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: determinedPagesOptions(userModel: userModel).length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      Get.back();
                      if (determinedPagesOptions(userModel: userModel)[index]
                              ['routeto'] ==
                          GetPages.kUserInformationsView) {
                        Get.toNamed(
                            determinedPagesOptions(userModel: userModel)[index]
                                ['routeto'],
                            arguments: {"personal": true, "id": "0"});
                      } else {
                        Get.toNamed(
                            determinedPagesOptions(userModel: userModel)[index]
                                ['routeto']);
                      }

                      Get.toNamed(
                          determinedPagesOptions(userModel: userModel)[index]
                              ['routeto']);
                    },
                    title: Text(
                        determinedPagesOptions(userModel: userModel)[index]
                            ['text']),
                    leading: Icon(
                        determinedPagesOptions(userModel: userModel)[index]
                            ['icon']),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
