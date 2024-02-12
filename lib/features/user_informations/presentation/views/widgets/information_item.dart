import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/helper/styles.dart';
import 'package:flutter/material.dart';

class InformationItem extends StatelessWidget {
  const InformationItem({
    super.key,
    required this.itemName,
    required this.itemValue,
  });

  final String itemName;
  final String itemValue;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 7, bottom: 7),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: kPrimaryLightColor, width: 2),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(
                itemName,
                style: Styles.textStyle20PrimaryColor,
              ),
              Text(
                itemValue,
                style: Styles.textStyle16,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
        ),
      ),
    );
  }
}
