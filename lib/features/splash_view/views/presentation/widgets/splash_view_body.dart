import 'package:faithful_servant/core/helper/assets.dart';
import 'package:flutter/material.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SafeArea(
        child: Column(
          children: [
            CircleAvatar(
              radius: MediaQuery.of(context).size.width * 0.4,
              backgroundImage: AssetImage(Assets.crossOfJesusImage),
            ),
            const Text(
              "عَبْدُ الرَّبِّ لاَ يَجِبُ أَنْ يُخَاصِمَ، بَلْ يَكُونُ مُتَرَفِّقًا بِالْجَمِيعِ، صَالِحًا لِلتَّعْلِيمِ، صَبُورًا عَلَى الْمَشَقَّاتِ، مُؤَدِّبًا بِالْوَدَاعَةِ الْمُقَاوِمِينَ، عَسَى أَنْ يُعْطِيَهُمُ اللهُ تَوْبَةً لِمَعْرِفَةِ الْحَقِّ، فَيَسْتَفِيقُوا مِنْ فَخِّ إِبْلِيسَ إِذْ قَدِ اقْتَنَصَهُمْ لإِرَادَتِهِ",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
