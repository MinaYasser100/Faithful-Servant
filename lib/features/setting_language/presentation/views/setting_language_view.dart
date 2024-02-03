import 'package:faithful_servant/features/setting_language/presentation/views/widgets/setting_language_view_body.dart';
import 'package:flutter/material.dart';

class SettinLanguagegView extends StatelessWidget {
  const SettinLanguagegView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const SettingLanguageViewBody(),
    );
  }
}
