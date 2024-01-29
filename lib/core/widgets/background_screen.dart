import 'package:faithful_servant/core/helper/assets.dart';
import 'package:faithful_servant/core/helper/styles.dart';
import 'package:flutter/material.dart';

class BackgroundScreen extends StatelessWidget {
  const BackgroundScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.2,
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.75,
            width: double.infinity,
            child: Image(
              image: AssetImage(Assets.crossOfJesusImage),
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'أَخْدِمُ الرَّبَّ بِكُلِّ تَوَاضُعٍ وَدُمُوعٍ كَثِيرَةٍ ( أعمال الرسل 20: 19)',
            style: Styles.textStyle20,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
