import 'package:faithful_servant/core/function/show_dialog/successfully_show_dialog.dart';
import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/helper/get_pages.dart';
import 'package:faithful_servant/core/helper/styles.dart';
import 'package:faithful_servant/features/ma5domeen/data/model/ma5domeen_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Ma5domeenSearchContentBady extends StatelessWidget {
  const Ma5domeenSearchContentBady({
    super.key,
    required this.stageName,
    required this.ma5domeenModel,
    required this.onPressed,
  });

  final String stageName;
  final Ma5domeenModel ma5domeenModel;
  final dynamic Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Get.toNamed(GetPages.ma5domeenDetailsView,
                arguments: ma5domeenModel);
          },
          child: Container(
            height: 70,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ListTile(
                      title: Text(
                        ma5domeenModel.name,
                        style: Styles.textStyle18.copyWith(color: kSecondColor),
                      ),
                      subtitle: Text(
                        ma5domeenModel.updateRegisterDate,
                        style: TextStyle(color: Colors.grey[400]),
                      ),
                    ),
                  ),
                  Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: kSecondColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: TextButton(
                      onPressed: () {
                        successfullyShowDialog(
                          context: context,
                          titleText: 'Alert'.tr,
                          contentText:
                              'Are you sure you want to delete this served ?'
                                  .tr,
                          buttonText: 'Delete'.tr,
                          onPressed: onPressed,
                        );
                      },
                      child: Text(
                        'Delete'.tr,
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
