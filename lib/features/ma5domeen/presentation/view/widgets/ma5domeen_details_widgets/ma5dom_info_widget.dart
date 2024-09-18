import 'package:faithful_servant/features/ma5domeen/data/model/ma5domeen_model.dart';
import 'package:flutter/material.dart';

import 'content_widget.dart';

class Ma5damInfoWidget extends StatelessWidget {
  const Ma5damInfoWidget({
    super.key,
    required this.ma5domeenModel,
  });

  final Ma5domeenModel ma5domeenModel;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Content(title: 'الاسم :', data: ma5domeenModel.name),
        const SizedBox(
          height: 10,
        ),
        Content(
            title: 'رقم التليفون الاول :', data: ma5domeenModel.phoneNumber1),
        const SizedBox(
          height: 10,
        ),
        Content(
            title: 'رقم التليفون الثانى :', data: ma5domeenModel.phoneNumber2),
        const SizedBox(
          height: 10,
        ),
        Content(title: 'العنوان :', data: ma5domeenModel.address),
        const SizedBox(
          height: 10,
        ),
        Content(title: 'تاريخ الميلاد :', data: ma5domeenModel.birthDate),
        const SizedBox(
          height: 10,
        ),
        Content(title: 'المؤهل :', data: ma5domeenModel.qualification),
        const SizedBox(
          height: 10,
        ),
        Content(
            title: 'اب الاعتراف :', data: ma5domeenModel.fatherOfConfession),
      ],
    );
  }
}
