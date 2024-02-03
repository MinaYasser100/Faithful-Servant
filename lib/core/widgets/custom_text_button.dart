import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/helper/local/locale_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextButton extends StatefulWidget {
  const CustomTextButton({
    super.key,
    required this.textButton,
    required this.onPressed,
    this.isArrowIcon = false,
  });
  final String textButton;
  final void Function() onPressed;
  final bool isArrowIcon;

  @override
  State<CustomTextButton> createState() => _CustomTextButtonState();
}

class _CustomTextButtonState extends State<CustomTextButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;
  @override
  void initState() {
    super.initState();

    handelAnimation();
  }

  @override
  Widget build(BuildContext context) {
    AppLocalController appLocalController = Get.find();
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width * 0.7,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: TextButton(
        onPressed: widget.onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _colorAnimation,
              builder: (context, child) {
                return Text(
                  widget.textButton,
                  style: TextStyle(
                    fontSize: 25,
                    color: _colorAnimation.value,
                  ),
                );
              },
            ),
            const SizedBox(
              width: 10,
            ),
            if (widget.isArrowIcon)
              AnimatedBuilder(
                animation: _colorAnimation,
                builder: (context, child) => Icon(
                  appLocalController.initilalLanguage == const Locale('en')
                      ? Icons.arrow_forward_ios_outlined
                      : Icons.arrow_back_ios_new_sharp,
                  color: _colorAnimation.value,
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void handelAnimation() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _colorAnimation = ColorTween(
      begin: kSecondColor,
      end: kPrimaryLightColor,
    ).animate(_controller);

    _controller.forward();
    detectAnimationStatus();
  }

  void detectAnimationStatus() {
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // Reverse the animation when it completes
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        // Forward the animation when it dismisses
        _controller.forward();
      }
    });
  }
}
