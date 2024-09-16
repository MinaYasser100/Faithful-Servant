import 'package:faithful_servant/core/helper/assets.dart';
import 'package:faithful_servant/core/helper/styles.dart';
import 'package:flutter/material.dart';

class BackgroundScreen extends StatelessWidget {
  const BackgroundScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 2 / 3,
          child: Image(
            image: AssetImage(Assets.crossOfJesusImage),
          ),
        ),
        const SizedBox(height: 130),
        const Opacity(
          opacity: 0.25,
          child: Text(
            'أَخْدِمُ الرَّبَّ بِكُلِّ تَوَاضُعٍ وَدُمُوعٍ كَثِيرَةٍ ( أعمال الرسل 20: 19)',
            style: Styles.textStyle20,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
