import 'package:faithful_servant/core/helper/constant.dart';
import 'package:flutter/material.dart';

class Ma5domeenBody extends StatelessWidget {
  const Ma5domeenBody({super.key, required this.nameStage});
  final String nameStage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: ma5domeenData.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(ma5domeenData[index].name),
              );
            },
          ),
        ),
      ],
    );
  }
}
