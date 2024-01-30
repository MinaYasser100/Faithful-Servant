import 'package:faithful_servant/core/helper/constant.dart';
import 'package:flutter/material.dart';

class ChooseYourChurch extends StatefulWidget {
  const ChooseYourChurch(
      {super.key,
      required this.items,
      required this.selectedItem,
      this.onChanged});
  final List<String> items;
  final String selectedItem;
  final void Function(String?)? onChanged;
  @override
  State<ChooseYourChurch> createState() => _ChooseYourChurchState();
}

class _ChooseYourChurchState extends State<ChooseYourChurch> {
  // final List<String> items = [saintGeorge, virginMary, saintMark, saintMain];
  // String selectedItem = saintGeorge;

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
              value: widget.selectedItem,
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
              onChanged: widget.onChanged,
              items: widget.items.map<DropdownMenuItem<String>>((String value) {
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
