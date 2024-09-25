import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/helper/get_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllServantsBodyView extends StatelessWidget {
  const AllServantsBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: currentServiceItems.length - 1,
        itemBuilder: (context, index) {
          return InkWell(
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
          );
        });
  }
}
