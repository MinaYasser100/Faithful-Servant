import 'package:faithful_servant/core/helper/constant.dart';
import 'package:flutter/material.dart';

class ChoosePrivilage extends StatefulWidget {
  const ChoosePrivilage({super.key});
  @override
  State<ChoosePrivilage> createState() => _ChoosePrivilageState();
}

class _ChoosePrivilageState extends State<ChoosePrivilage> {
  final List<String> items = ['المشرف العام', 'امين الخدمة', 'خادم'];

  String selectedItem = 'المشرف العام';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: kPrimaryColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(30),
            color: kSecondColor,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: DropdownButton<String>(
              underline: Container(),
              isExpanded: true,
              value: selectedItem,
              icon: const Icon(
                Icons.arrow_drop_down_circle_outlined,
                color: kPrimaryColor,
              ),
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(
                color: kPrimaryLightColor,
                fontSize: 20,
              ),
              borderRadius: BorderRadius.circular(30),
              onChanged: (newValue) {
                setState(() {
                  selectedItem = newValue!;
                });
              },
              items: items.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}