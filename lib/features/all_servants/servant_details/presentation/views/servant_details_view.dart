import 'package:faithful_servant/core/function/get_first_three_words.dart';
import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/helper/styles.dart';
import 'package:faithful_servant/core/widgets/design_body.dart';
import 'package:faithful_servant/features/all_servants/servant_details/presentation/views/widgets/servant_details_body_view.dart';
import 'package:faithful_servant/features/register/data/model/user_model.dart';
import 'package:flutter/material.dart';

class ServantDetailsView extends StatelessWidget {
  const ServantDetailsView({super.key, required this.userModel});
  final UserModel userModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        foregroundColor: kSecondColor,
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(userModel.image),
          ),
        ),
        title: Text(
          getFirstThreeWords(userModel.name),
          style: Styles.textStyle22SecondColor,
        ),
      ),
      body: DesignBody(
          widget: ServantDetailsBodyView(
        userModel: userModel,
      )),
    );
  }
}
