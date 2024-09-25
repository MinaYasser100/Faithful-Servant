import 'package:animate_do/animate_do.dart';
import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/helper/get_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllServantsBodyView extends StatelessWidget {
  const AllServantsBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: RawScrollbar(
        interactive: true,
        thickness: 6,
        radius: const Radius.circular(20),
        thumbColor: kPrimaryColor,
        minThumbLength: 40,
        minOverscrollLength: 40,
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: ListView.builder(
            itemCount: currentServiceItems.length - 1,
            itemBuilder: (context, index) {
              return FadeInDown(
                duration: const Duration(milliseconds: 400),
                animate: true,
                curve: Curves.easeInOut,
                child: InkWell(
                  onTap: () {
                    Get.toNamed(
                      GetPages.kAllServantsForStage,
                      arguments: currentServiceItems[index],
                    );
                  },
                  child: Card(
                    margin: const EdgeInsets.all(20),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        currentServiceItems[index],
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
