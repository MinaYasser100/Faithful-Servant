import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/features/general_manager/presentation/views/widgets/one_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageCards extends StatelessWidget {
  const PageCards({super.key, required this.screensList});
  final List<Map<dynamic, dynamic>> screensList;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(bodyRadious),
                topRight: Radius.circular(bodyRadious)),
            color: kSecondColor),
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: GridView.builder(
            itemCount: screensList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              return EachCard(
                text: screensList[index]['text'],
                btnText: screensList[index]['btntext'],
                icon: screensList[index]['icon'],
                onPressed: () {
                  Get.toNamed(screensList[index]["routeto"]);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
