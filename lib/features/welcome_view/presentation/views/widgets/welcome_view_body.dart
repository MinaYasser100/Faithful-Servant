import 'package:faithful_servant/core/widgets/background_screen.dart';
import 'package:flutter/material.dart';

class WelcomeViewBody extends StatelessWidget {
  const WelcomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20.0),
      child: SafeArea(
        child: Column(
          children: [
            BackgroundScreen(),
          ],
        ),
      ),
    );
  }
}
