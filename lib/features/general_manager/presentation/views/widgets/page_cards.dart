import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/features/general_manager/presentation/views/widgets/one_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageCards extends StatelessWidget {
  const PageCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0)),
            color: kSecondColor),
        child: GridView.builder(
          itemCount: pagesafterfilter.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (context, index) {
            return EachCard(
              text: pagesafterfilter[index]['text'],
              btnText: pagesafterfilter[index]['btntext'],
              icon: pagesafterfilter[index]['icon'],
              onPressed: () {
                Get.toNamed(pagesafterfilter[index]["routeto"]);
              },
            );
          },
        ),
      ),
    );
  }
}
