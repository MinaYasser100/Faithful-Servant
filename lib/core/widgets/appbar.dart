import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/helper/styles.dart';
import 'package:flutter/material.dart';

class GeneralAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color backgroundColor = kPrimaryColor;
  final String title;
  final AppBar appBar;
  final List<Widget>? widgets;

  /// you can add more fields that meet your needs

  const GeneralAppBar(
      {super.key, required this.title, required this.appBar, this.widgets});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: kSecondColor),
      title: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          title,
          style: Styles.textStyle25SecondColor,
        ),
      ),
      backgroundColor: backgroundColor,
      actions: widgets,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
