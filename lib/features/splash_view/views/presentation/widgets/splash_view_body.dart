import 'package:faithful_servant/core/helper/assets.dart';
import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/helper/get_pages.dart';
import 'package:faithful_servant/core/helper/styles.dart';
import 'package:faithful_servant/core/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              SizedBox(
                height: 320,
                child: Image(image: AssetImage(Assets.jesusAndYourSon))
                    .animate()
                    .fadeIn(duration: const Duration(milliseconds: 300))
                    .slide(),
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                "عَبْدُ الرَّبِّ لاَ يَجِبُ أَنْ يُخَاصِمَ، بَلْ يَكُونُ مُتَرَفِّقًا بِالْجَمِيعِ، صَالِحًا لِلتَّعْلِيمِ، صَبُورًا عَلَى الْمَشَقَّاتِ، مُؤَدِّبًا بِالْوَدَاعَةِ الْمُقَاوِمِينَ، عَسَى أَنْ يُعْطِيَهُمُ اللهُ تَوْبَةً لِمَعْرِفَةِ الْحَقِّ، فَيَسْتَفِيقُوا مِنْ فَخِّ إِبْلِيسَ إِذْ قَدِ اقْتَنَصَهُمْ لإِرَادَتِهِ",
                style: Styles.textStyle20,
                textAlign: TextAlign.center,
              ).animate().tint(color: kPrimaryColor).then().shake(),
              const SizedBox(
                height: 40,
              ),
              CustomTextButton(
                onPressed: () {
                  Get.toNamed(
                    GetPages.kWelcomeView,
                  );
                },
                textButton: "Get Start".tr,
                isArrowIcon: true,
              ),
              const SizedBox(
                height: 60,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
