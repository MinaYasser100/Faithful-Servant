import 'package:faithful_servant/core/helper/styles.dart';
import 'package:faithful_servant/features/personal/presentation/views/widgets/history_card.dart';
import 'package:flutter/material.dart';

class HistoryBody extends StatelessWidget {
  const HistoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'تاريخي في الخدمة الكنسية',
          style: Styles.textStyle20,
        ),
        const Divider(indent: 100, endIndent: 100),
        Expanded(
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return const HistoryCard();
            },
          ),
        )
      ],
    );
  }
}
