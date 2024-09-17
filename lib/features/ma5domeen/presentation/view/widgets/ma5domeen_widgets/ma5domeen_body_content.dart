import 'package:faithful_servant/core/function/screen_action/successfully_show_dialog.dart';
import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/helper/get_pages.dart';
import 'package:faithful_servant/core/helper/styles.dart';
import 'package:faithful_servant/features/ma5domeen/data/model/ma5domeen_model.dart';
import 'package:faithful_servant/features/ma5domeen/presentation/manager/ma5domeen_cubit.dart';
import 'package:faithful_servant/features/ma5domeen/presentation/manager/ma5domeen_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class Ma5domeenBodyContent extends StatelessWidget {
  const Ma5domeenBodyContent(
      {super.key,
      required this.ma5doomName,
      required this.editDate,
      required this.stageName,
      required this.servedId,
      required this.ma5domeenModel});
  final String ma5doomName;
  final String editDate;
  final String stageName;
  final String servedId;
  final Ma5domeenModel ma5domeenModel;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Ma5domeenCubit, Ma5domeenStates>(
      builder: (context, state) {
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
                            ma5doomName,
                            style: Styles.textStyle18
                                .copyWith(color: kSecondColor),
                          ),
                          subtitle: Text(
                            editDate,
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
                              onPressed: () {
                                BlocProvider.of<Ma5domeenCubit>(context)
                                    .deleteMa5doom(
                                  stageName: stageName,
                                  servedId: servedId,
                                );
                                BlocProvider.of<Ma5domeenCubit>(context)
                                    .gettingMa5domeenData(stageName);
                              },
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
      },
    );
  }
}
