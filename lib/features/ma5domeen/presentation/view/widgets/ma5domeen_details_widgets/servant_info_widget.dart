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
    return Column(
      children: [
        const Divider(),
        Row(
          children: [
            const Text(
              'من قام بأضافه هذا المخدوم :',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            Flexible(
              child: Text(ma5domeenModel.adderName,
                  style: const TextStyle(fontSize: 12),
                  overflow: TextOverflow.visible),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            const Text(
              'تاريخ اضافه المخدوم :',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            Flexible(
              child: Text(ma5domeenModel.registerDate,
                  style: const TextStyle(fontSize: 12),
                  overflow: TextOverflow.visible),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            const Text(
              'تاريخ اخر تعديل للبيانات :',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            Flexible(
              child: Text(ma5domeenModel.updateRegisterDate,
                  style: const TextStyle(fontSize: 12),
                  overflow: TextOverflow.visible),
            )
          ],
        ),
      ],
    );
  }
}
