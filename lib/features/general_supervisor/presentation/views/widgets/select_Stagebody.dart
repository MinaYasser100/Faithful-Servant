import 'package:animate_do/animate_do.dart';
import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/helper/get_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectStagebody extends StatelessWidget {
  const SelectStagebody(
      {super.key, required this.itemCount, required this.numToStart});
  final int itemCount;
  final int numToStart;
  @override
  Widget build(BuildContext context) {
    return RawScrollbar(
      interactive: true,
      thickness: 6,
      radius: const Radius.circular(20),
      thumbColor: kPrimaryColor,
      minThumbLength: 40,
      minOverscrollLength: 40,
      padding: const EdgeInsets.only(top: 0, bottom: 20),
      child: ListView.builder(
          itemCount: itemCount,
          itemBuilder: (context, index) {
            return FadeInDown(
              duration: const Duration(milliseconds: 400),
              animate: true,
              curve: Curves.easeInOut,
              child: InkWell(
                onTap: () {
                  Get.toNamed(GetPages.ma5domeenView,
                      arguments: currentServiceItems[index]);
                },
                child: Card(
                  margin: const EdgeInsets.all(20),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      currentServiceItems[index + numToStart],
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
