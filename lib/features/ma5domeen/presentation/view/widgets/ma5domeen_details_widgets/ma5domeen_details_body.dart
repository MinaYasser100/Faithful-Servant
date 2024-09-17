import 'package:faithful_servant/features/ma5domeen/data/model/ma5domeen_model.dart';
import 'package:flutter/material.dart';

class Ma5domeenDetailsBody extends StatelessWidget{
  const Ma5domeenDetailsBody({super.key, required this.ma5domeenModel});
final Ma5domeenModel ma5domeenModel;
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(child: Column(children: [
        Content(title: 'الاسم :', data:ma5domeenModel.name),
        const SizedBox(height: 10,),
        Content(title:'رقم التليفون الاول :', data:ma5domeenModel.phoneNumber1),
        const SizedBox(height: 10,),
        Content(title:'رقم التليفون الثانى :' , data: ma5domeenModel.phoneNumber2),
        const SizedBox(height: 10,),
        Content(title: 'العنوان :', data: ma5domeenModel.address),
        const SizedBox(height: 10,),
        Content(title: 'تاريخ الميلاد :', data:ma5domeenModel.birthDate),
        const SizedBox(height: 10,),
        Content(title: 'المؤهل :', data: ma5domeenModel.qualification),
        const SizedBox(height: 10,),
        Content(title: 'اب الاعتراف :', data:ma5domeenModel.fatherOfConfession),
        ],),),
        Container(child: Column(children: [
        Row(children: [
    const Text('من قام بأضافه هذا المخدوم :', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
    Text(ma5domeenModel.adderName , style: const TextStyle(fontSize: 12),overflow: TextOverflow.ellipsis)
        ],),
       
        const SizedBox(height: 10,),
        Row(children: [
    const Text('تاريخ اضافه المخدوم :', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
    Text(ma5domeenModel.registerDate , style: const TextStyle(fontSize: 12),overflow: TextOverflow.ellipsis)
        ],),
      
        const SizedBox(height: 10,),
         Row(children: [
    const Text( 'تاريخ اخر تعديل للبيانات :', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
    Text(ma5domeenModel.updateRegisterDate , style: const TextStyle(fontSize: 12),overflow: TextOverflow.ellipsis)
        ],),
    ],),)
      ],
    );
  }
  
}


class Content extends StatelessWidget{
  final String title;
  final String data;

  const Content({super.key, required this.title, required this.data});
  @override
  Widget build(BuildContext context) {
    return 
    Row(children: [
      Text(title , style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
      Text(data , style: const TextStyle(fontSize: 17),overflow: TextOverflow.ellipsis)
    ],);
  }
  
}