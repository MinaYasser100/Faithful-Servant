import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/helper/get_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectStagebody extends StatelessWidget{
  const SelectStagebody({super.key, required this.itemCount, required this.numToStart});
final int itemCount;
final int numToStart;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: itemCount,
    itemBuilder: (context, index) {
      return  InkWell(onTap: () {
        Get.toNamed(GetPages.ma5domeenView , arguments:currentServiceItems[index] );
        
      },
        child: Card (
        margin: const EdgeInsets.all(20),child: Text(currentServiceItems[index +numToStart],textAlign: TextAlign.center,style: const TextStyle(fontSize: 20),),
      
      ),);
    });
    
    
  }
  
}