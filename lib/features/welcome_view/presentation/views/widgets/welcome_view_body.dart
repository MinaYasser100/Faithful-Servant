import 'package:faithful_servant/core/widgets/background_screen.dart';
import 'package:faithful_servant/core/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';

class WelcomeViewBody extends StatelessWidget {
  const WelcomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            const BackgroundScreen(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.34,
              width: double.infinity,
              child: Column(
                children: [
                  CustomTextButton(
                    textButton: 'Register',
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextButton(
                    textButton: "Login",
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
