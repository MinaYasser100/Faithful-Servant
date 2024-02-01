import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/helper/styles.dart';
import 'package:flutter/material.dart';

class EachCard extends StatelessWidget {
  final String text;
  final String btnText;
  final IconData icon;
  final Function()? onPressed;
  const EachCard({
    super.key,
    required this.text,
    required this.btnText,
    required this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: kPrimaryColor,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                text,
                style: Styles.textStyle25SecondColor,
              ),
              ElevatedButton.icon(
                onPressed: onPressed,
                label: Text(btnText),
                icon: Icon(icon),
              )
            ],
          ),
        ),
      ),
    );
  }
}
