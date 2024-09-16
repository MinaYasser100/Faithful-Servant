import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/widgets/appbar.dart';
import 'package:faithful_servant/features/ma5domeen/presentation/manager/ma5domeen_cubit.dart';
import 'package:faithful_servant/features/ma5domeen/presentation/view/widgets/ma5domeen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class Ma5domeenView extends StatefulWidget{
  const Ma5domeenView({super.key});

  @override
  State<Ma5domeenView> createState() =>_Ma5domeenView();
}
class _Ma5domeenView extends State<Ma5domeenView>{

  @override
  Widget build(BuildContext context) {
    String namestage=Get.arguments as String ;
   return BlocProvider(
    create: (context) => Ma5domeenCubit()..gettingMa5domeenData(),
    child:  Scaffold(
    appBar:GeneralAppBar(title:stageName, appBar: AppBar()) ,
    body:  Ma5domeenBody(namestage: namestage,),
    )
   );
  }
  
}