import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/helper/get_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Ma5domeenBody extends StatelessWidget{
  const Ma5domeenBody({super.key, required this.namestage});
final String namestage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:FloatingActionButton(onPressed: (){
         Get.toNamed(GetPages.addMa5domeenview ,arguments: namestage);
      },
      backgroundColor: kPrimaryLightColor,
      child: const Icon(Icons.add),
      ),
    body: ListView.builder(itemCount:  ma5domeenData.length,
    itemBuilder: (context, index) {
      return ListTile(
        title:Text( ma5domeenData[index].name),
      );
    },
    ),

                
            
    );
  }
  
}