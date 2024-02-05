import 'package:faithful_servant/features/servant/presentation/views/widgets/servant_view_body.dart';
import 'package:flutter/material.dart';

class ServantView extends StatelessWidget {
  const ServantView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ServantViewBody(),
    );
  }
}
