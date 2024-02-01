import 'package:faithful_servant/core/helper/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerPagesOptions extends StatelessWidget {
  const DrawerPagesOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: ListView.builder(
          itemCount: pagesafterfilter.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                Get.back();
                Get.toNamed(pagesafterfilter[index]['routeto']);
              },
              title: Text(pagesafterfilter[index]['text']),
              leading: Icon(pagesafterfilter[index]['icon']),
            );
          },
        ),
      ),
    );
  }
}
