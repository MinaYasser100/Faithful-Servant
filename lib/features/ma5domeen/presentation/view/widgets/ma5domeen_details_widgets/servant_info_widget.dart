import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/features/ma5domeen/data/model/ma5domeen_model.dart';
import 'package:flutter/material.dart';

class ServantInfoWidget extends StatelessWidget {
  const ServantInfoWidget({
    super.key,
    required this.ma5domeenModel,
  });

  final Ma5domeenModel ma5domeenModel;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(),
        Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'من قام بأضافه هذا المخدوم :',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,color: kPrimaryColor),
            ),
            Text(ma5domeenModel.adderName,
                style: const TextStyle(fontSize: 15),
                overflow: TextOverflow.visible)
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'تاريخ اضافه المخدوم :',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,color: kPrimaryColor),
            ),
            Text(ma5domeenModel.registerDate,
                style: const TextStyle(fontSize: 15),
                overflow: TextOverflow.visible)
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'تاريخ اخر تعديل للبيانات :',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,color: kPrimaryColor),
            ),
            Text(ma5domeenModel.updateRegisterDate,
                style: const TextStyle(fontSize: 15),
                overflow: TextOverflow.visible)
          ],
        ),
      ],
    );
  }
}
