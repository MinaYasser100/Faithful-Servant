import 'package:faithful_servant/core/helper/constant.dart';
import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({
    super.key,
    this.indicatorColor = kPrimaryColor,
    this.textColor = kPrimaryColor,
  });
  final Color indicatorColor;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: SizedBox(
            width: 50,
            height: 50,
            child: CircularProgressIndicator(
              color: indicatorColor,
            ),
          ),
        ),
        const SizedBox(
          height: 7,
        ),
        Text('Loading ...', style: TextStyle(color: textColor)),
      ],
    );
  }
}
