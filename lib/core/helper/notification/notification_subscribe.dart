import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/features/register/data/model/user_model.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> doNotificationSubscribe(UserModel? userModel) async {
  if (userModel!.currentService == 'حضانة كيجي 1') {
    await FirebaseMessaging.instance.subscribeToTopic(userTopics['الكل']!);
    await FirebaseMessaging.instance
        .subscribeToTopic(userTopics['حضانة كيجي 1']!);
    await FirebaseMessaging.instance
        .subscribeToTopic(userTopics['مرحلة كيجي']!);
  } else if (userModel.currentService == 'حضانة كيجي 2') {
    await FirebaseMessaging.instance.subscribeToTopic(userTopics['الكل']!);
    await FirebaseMessaging.instance
        .subscribeToTopic(userTopics['مرحلة كيجي']!);
    await FirebaseMessaging.instance
        .subscribeToTopic(userTopics['مرحلة كيجي']!);
  } else if (userModel.currentService == 'اولي ابتدائي') {
    await FirebaseMessaging.instance.subscribeToTopic(userTopics['الكل']!);
    await FirebaseMessaging.instance
        .subscribeToTopic(userTopics['اولي ابتدائي']!);
    await FirebaseMessaging.instance.subscribeToTopic(userTopics['ابتدائي']!);
  } else if (userModel.currentService == 'ثانية ابتدائي') {
    await FirebaseMessaging.instance.subscribeToTopic(userTopics['الكل']!);
    await FirebaseMessaging.instance
        .subscribeToTopic(userTopics['ثانية ابتدائي']!);
    await FirebaseMessaging.instance.subscribeToTopic(userTopics['ابتدائي']!);
  } else if (userModel.currentService == 'ثالثة ابتدائي') {
    await FirebaseMessaging.instance.subscribeToTopic(userTopics['الكل']!);
    await FirebaseMessaging.instance
        .subscribeToTopic(userTopics['ثالثة ابتدائي']!);
    await FirebaseMessaging.instance.subscribeToTopic(userTopics['ابتدائي']!);
  } else if (userModel.currentService == 'رابعة ابتدائي') {
    await FirebaseMessaging.instance.subscribeToTopic(userTopics['الكل']!);
    await FirebaseMessaging.instance
        .subscribeToTopic(userTopics['رابعة ابتدائي']!);
    await FirebaseMessaging.instance.subscribeToTopic(userTopics['ابتدائي']!);
  } else if (userModel.currentService == 'خامسة ابتدائي') {
    await FirebaseMessaging.instance.subscribeToTopic(userTopics['الكل']!);
    await FirebaseMessaging.instance
        .subscribeToTopic(userTopics['خامسة ابتدائي']!);
    await FirebaseMessaging.instance.subscribeToTopic(userTopics['ابتدائي']!);
  } else if (userModel.currentService == 'سادسة ابتدائي') {
    await FirebaseMessaging.instance.subscribeToTopic(userTopics['الكل']!);
    await FirebaseMessaging.instance
        .subscribeToTopic(userTopics['سادسة ابتدائي']!);
    await FirebaseMessaging.instance.subscribeToTopic(userTopics['ابتدائي']!);
  } else if (userModel.currentService == 'اعدادي بنين') {
    await FirebaseMessaging.instance.subscribeToTopic(userTopics['الكل']!);
    await FirebaseMessaging.instance
        .subscribeToTopic(userTopics['اعدادي بنين']!);
    await FirebaseMessaging.instance.subscribeToTopic(userTopics['أعدادي']!);
    await FirebaseMessaging.instance
        .subscribeToTopic(userTopics['اعدادي و ثانوي']!);
  } else if (userModel.currentService == 'اعدادي بنات') {
    await FirebaseMessaging.instance.subscribeToTopic(userTopics['الكل']!);
    await FirebaseMessaging.instance
        .subscribeToTopic(userTopics['اعدادي بنات']!);
    await FirebaseMessaging.instance.subscribeToTopic(userTopics['أعدادي']!);
    await FirebaseMessaging.instance
        .subscribeToTopic(userTopics['اعدادي و ثانوي']!);
  } else if (userModel.currentService == 'ثانوي بنين') {
    await FirebaseMessaging.instance.subscribeToTopic(userTopics['الكل']!);
    await FirebaseMessaging.instance
        .subscribeToTopic(userTopics['ثانوي بنين']!);
    await FirebaseMessaging.instance.subscribeToTopic(userTopics['ثانوي']!);
    await FirebaseMessaging.instance
        .subscribeToTopic(userTopics['اعدادي و ثانوي']!);
  } else if (userModel.currentService == 'ثانوي بنات') {
    await FirebaseMessaging.instance.subscribeToTopic(userTopics['الكل']!);
    await FirebaseMessaging.instance
        .subscribeToTopic(userTopics['ثانوي بنات']!);
    await FirebaseMessaging.instance
        .subscribeToTopic(userTopics['اعدادي و ثانوي']!);
    await FirebaseMessaging.instance.subscribeToTopic(userTopics['ثانوي']!);
  } else if (userModel.currentService == 'جامعيين') {
    await FirebaseMessaging.instance.subscribeToTopic(userTopics['الكل']!);
    await FirebaseMessaging.instance.subscribeToTopic(userTopics['جامعيين']!);
    await FirebaseMessaging.instance.subscribeToTopic(userTopics['شباب']!);
  } else if (userModel.currentService == 'خريجين') {
    await FirebaseMessaging.instance.subscribeToTopic(userTopics['الكل']!);
    await FirebaseMessaging.instance.subscribeToTopic(userTopics['خريجين']!);
    await FirebaseMessaging.instance.subscribeToTopic(userTopics['شباب']!);
  } else if (userModel.currentService == 'الشعب') {
    await FirebaseMessaging.instance.subscribeToTopic(userTopics['الكل']!);
    await FirebaseMessaging.instance.subscribeToTopic(userTopics['الشعب']!);
  } else if (userModel.currentService == 'اجتماع الرجال') {
    await FirebaseMessaging.instance.subscribeToTopic(userTopics['الكل']!);
    await FirebaseMessaging.instance
        .subscribeToTopic(userTopics['اجتماع الرجال']!);
  } else if (userModel.currentService == 'اجتماع الخدام') {
    await FirebaseMessaging.instance.subscribeToTopic(userTopics['الكل']!);
    await FirebaseMessaging.instance
        .subscribeToTopic(userTopics['اجتماع الخدام']!);
    await FirebaseMessaging.instance
        .subscribeToTopic(userTopics['خدام و اعداد خدام']!);
  } else if (userModel.currentService == 'مدارس احد يوم الاحد') {
    await FirebaseMessaging.instance.subscribeToTopic(userTopics['الكل']!);
    await FirebaseMessaging.instance
        .subscribeToTopic(userTopics['مدارس احد يوم الاحد']!);
  } else if (userModel.currentService == 'اعداد خدام') {
    await FirebaseMessaging.instance.subscribeToTopic(userTopics['الكل']!);
    await FirebaseMessaging.instance
        .subscribeToTopic(userTopics['اعداد خدام']!);
    await FirebaseMessaging.instance
        .subscribeToTopic(userTopics['خدام و اعداد خدام']!);
  } else if (userModel.currentService == 'الام دولاجي') {
    await FirebaseMessaging.instance.subscribeToTopic(userTopics['الكل']!);
    await FirebaseMessaging.instance
        .subscribeToTopic(userTopics['الام دولاجي']!);
  } else if (userModel.currentService == 'الحكيمات') {
    await FirebaseMessaging.instance.subscribeToTopic(userTopics['الكل']!);
    await FirebaseMessaging.instance.subscribeToTopic(userTopics['الحكيمات']!);
  } else if (userModel.currentService == 'المسرح') {
    await FirebaseMessaging.instance.subscribeToTopic(userTopics['الكل']!);
    await FirebaseMessaging.instance.subscribeToTopic(userTopics['المسرح']!);
    await FirebaseMessaging.instance.subscribeToTopic(userTopics['الأنشطة']!);
  } else if (userModel.currentService == 'وسائل الايضاح') {
    await FirebaseMessaging.instance.subscribeToTopic(userTopics['الكل']!);
    await FirebaseMessaging.instance
        .subscribeToTopic(userTopics['وسائل الايضاح']!);
    await FirebaseMessaging.instance.subscribeToTopic(userTopics['الأنشطة']!);
  } else if (userModel.currentService == 'اخوة الرب') {
    await FirebaseMessaging.instance.subscribeToTopic(userTopics['الكل']!);
    await FirebaseMessaging.instance.subscribeToTopic(userTopics['اخوة الرب']!);
  } else if (userModel.currentService == 'الكورالات') {
    await FirebaseMessaging.instance.subscribeToTopic(userTopics['الكل']!);
    await FirebaseMessaging.instance.subscribeToTopic(userTopics['الكورالات']!);
    await FirebaseMessaging.instance.subscribeToTopic(userTopics['الأنشطة']!);
  } else if (userModel.currentService == 'منسقين المهرجان') {
    await FirebaseMessaging.instance.subscribeToTopic(userTopics['الكل']!);
    await FirebaseMessaging.instance
        .subscribeToTopic(userTopics['منسقين المهرجان']!);
  } else if (userModel.currentService == 'الكشافة') {
    await FirebaseMessaging.instance.subscribeToTopic(userTopics['الكل']!);
    await FirebaseMessaging.instance.subscribeToTopic(userTopics['الكشافة']!);
    await FirebaseMessaging.instance.subscribeToTopic(userTopics['الأنشطة']!);
  } else if (userModel.currentService == 'مركز المشورة') {
    await FirebaseMessaging.instance.subscribeToTopic(userTopics['الكل']!);
    await FirebaseMessaging.instance
        .subscribeToTopic(userTopics['مركز المشورة']!);
  } else if (userModel.currentService == 'مدرسة الشمامسة') {
    await FirebaseMessaging.instance.subscribeToTopic(userTopics['الكل']!);
    await FirebaseMessaging.instance
        .subscribeToTopic(userTopics['مدرسة الشمامسة']!);
  } else if (userModel.currentService == 'كاهن') {
    await FirebaseMessaging.instance.subscribeToTopic(userTopics['الكل']!);
    await FirebaseMessaging.instance.subscribeToTopic(userTopics['كاهن']!);
  }
}

Future<void> doNotificationUnsubscribe(UserModel? userModel) async {
  if (userModel!.currentService == 'حضانة كيجي 1') {
    await FirebaseMessaging.instance.unsubscribeFromTopic(userTopics['الكل']!);
    await FirebaseMessaging.instance
        .unsubscribeFromTopic(userTopics['حضانة كيجي 1']!);
    await FirebaseMessaging.instance
        .unsubscribeFromTopic(userTopics['مرحلة كيجي']!);
  } else if (userModel.currentService == 'حضانة كيجي 2') {
    await FirebaseMessaging.instance.unsubscribeFromTopic(userTopics['الكل']!);
    await FirebaseMessaging.instance
        .unsubscribeFromTopic(userTopics['مرحلة كيجي']!);
    await FirebaseMessaging.instance
        .unsubscribeFromTopic(userTopics['مرحلة كيجي']!);
  } else if (userModel.currentService == 'اولي ابتدائي') {
    await FirebaseMessaging.instance.unsubscribeFromTopic(userTopics['الكل']!);
    await FirebaseMessaging.instance
        .unsubscribeFromTopic(userTopics['اولي ابتدائي']!);
    await FirebaseMessaging.instance
        .unsubscribeFromTopic(userTopics['ابتدائي']!);
  } else if (userModel.currentService == 'ثانية ابتدائي') {
    await FirebaseMessaging.instance.unsubscribeFromTopic(userTopics['الكل']!);
    await FirebaseMessaging.instance
        .unsubscribeFromTopic(userTopics['ثانية ابتدائي']!);
    await FirebaseMessaging.instance
        .unsubscribeFromTopic(userTopics['ابتدائي']!);
  } else if (userModel.currentService == 'ثالثة ابتدائي') {
    await FirebaseMessaging.instance.unsubscribeFromTopic(userTopics['الكل']!);
    await FirebaseMessaging.instance
        .unsubscribeFromTopic(userTopics['ثالثة ابتدائي']!);
    await FirebaseMessaging.instance
        .unsubscribeFromTopic(userTopics['ابتدائي']!);
  } else if (userModel.currentService == 'رابعة ابتدائي') {
    await FirebaseMessaging.instance.unsubscribeFromTopic(userTopics['الكل']!);
    await FirebaseMessaging.instance
        .unsubscribeFromTopic(userTopics['رابعة ابتدائي']!);
    await FirebaseMessaging.instance
        .unsubscribeFromTopic(userTopics['ابتدائي']!);
  } else if (userModel.currentService == 'خامسة ابتدائي') {
    await FirebaseMessaging.instance.unsubscribeFromTopic(userTopics['الكل']!);
    await FirebaseMessaging.instance
        .unsubscribeFromTopic(userTopics['خامسة ابتدائي']!);
    await FirebaseMessaging.instance
        .unsubscribeFromTopic(userTopics['ابتدائي']!);
  } else if (userModel.currentService == 'سادسة ابتدائي') {
    await FirebaseMessaging.instance.unsubscribeFromTopic(userTopics['الكل']!);
    await FirebaseMessaging.instance
        .unsubscribeFromTopic(userTopics['سادسة ابتدائي']!);
    await FirebaseMessaging.instance
        .unsubscribeFromTopic(userTopics['ابتدائي']!);
  } else if (userModel.currentService == 'اعدادي بنين') {
    await FirebaseMessaging.instance.unsubscribeFromTopic(userTopics['الكل']!);
    await FirebaseMessaging.instance
        .unsubscribeFromTopic(userTopics['اعدادي بنين']!);
    await FirebaseMessaging.instance
        .unsubscribeFromTopic(userTopics['أعدادي']!);
    await FirebaseMessaging.instance
        .unsubscribeFromTopic(userTopics['اعدادي و ثانوي']!);
  } else if (userModel.currentService == 'اعدادي بنات') {
    await FirebaseMessaging.instance.unsubscribeFromTopic(userTopics['الكل']!);
    await FirebaseMessaging.instance
        .unsubscribeFromTopic(userTopics['اعدادي بنات']!);
    await FirebaseMessaging.instance
        .unsubscribeFromTopic(userTopics['أعدادي']!);
    await FirebaseMessaging.instance
        .unsubscribeFromTopic(userTopics['اعدادي و ثانوي']!);
  } else if (userModel.currentService == 'ثانوي بنين') {
    await FirebaseMessaging.instance.unsubscribeFromTopic(userTopics['الكل']!);
    await FirebaseMessaging.instance
        .unsubscribeFromTopic(userTopics['ثانوي بنين']!);
    await FirebaseMessaging.instance.unsubscribeFromTopic(userTopics['ثانوي']!);
    await FirebaseMessaging.instance
        .unsubscribeFromTopic(userTopics['اعدادي و ثانوي']!);
  } else if (userModel.currentService == 'ثانوي بنات') {
    await FirebaseMessaging.instance.unsubscribeFromTopic(userTopics['الكل']!);
    await FirebaseMessaging.instance
        .unsubscribeFromTopic(userTopics['ثانوي بنات']!);
    await FirebaseMessaging.instance.unsubscribeFromTopic(userTopics['ثانوي']!);
    await FirebaseMessaging.instance
        .unsubscribeFromTopic(userTopics['اعدادي و ثانوي']!);
  } else if (userModel.currentService == 'جامعيين') {
    await FirebaseMessaging.instance.unsubscribeFromTopic(userTopics['الكل']!);
    await FirebaseMessaging.instance
        .unsubscribeFromTopic(userTopics['جامعيين']!);
    await FirebaseMessaging.instance.unsubscribeFromTopic(userTopics['شباب']!);
  } else if (userModel.currentService == 'خريجين') {
    await FirebaseMessaging.instance.unsubscribeFromTopic(userTopics['الكل']!);
    await FirebaseMessaging.instance
        .unsubscribeFromTopic(userTopics['خريجين']!);
    await FirebaseMessaging.instance.unsubscribeFromTopic(userTopics['شباب']!);
  } else if (userModel.currentService == 'الشعب') {
    await FirebaseMessaging.instance.unsubscribeFromTopic(userTopics['الكل']!);
    await FirebaseMessaging.instance.unsubscribeFromTopic(userTopics['الشعب']!);
  } else if (userModel.currentService == 'اجتماع الرجال') {
    await FirebaseMessaging.instance.unsubscribeFromTopic(userTopics['الكل']!);
    await FirebaseMessaging.instance
        .unsubscribeFromTopic(userTopics['اجتماع الرجال']!);
  } else if (userModel.currentService == 'اجتماع الخدام') {
    await FirebaseMessaging.instance.unsubscribeFromTopic(userTopics['الكل']!);
    await FirebaseMessaging.instance
        .unsubscribeFromTopic(userTopics['اجتماع الخدام']!);
    await FirebaseMessaging.instance
        .unsubscribeFromTopic(userTopics['خدام و اعداد خدام']!);
  } else if (userModel.currentService == 'مدارس احد يوم الاحد') {
    await FirebaseMessaging.instance.unsubscribeFromTopic(userTopics['الكل']!);
    await FirebaseMessaging.instance
        .unsubscribeFromTopic(userTopics['مدارس احد يوم الاحد']!);
  } else if (userModel.currentService == 'اعداد خدام') {
    await FirebaseMessaging.instance.unsubscribeFromTopic(userTopics['الكل']!);
    await FirebaseMessaging.instance
        .unsubscribeFromTopic(userTopics['اعداد خدام']!);
    await FirebaseMessaging.instance
        .unsubscribeFromTopic(userTopics['خدام و اعداد خدام']!);
  } else if (userModel.currentService == 'الام دولاجي') {
    await FirebaseMessaging.instance.unsubscribeFromTopic(userTopics['الكل']!);
    await FirebaseMessaging.instance
        .unsubscribeFromTopic(userTopics['الام دولاجي']!);
  } else if (userModel.currentService == 'الحكيمات') {
    await FirebaseMessaging.instance.unsubscribeFromTopic(userTopics['الكل']!);
    await FirebaseMessaging.instance
        .unsubscribeFromTopic(userTopics['الحكيمات']!);
  } else if (userModel.currentService == 'المسرح') {
    await FirebaseMessaging.instance.unsubscribeFromTopic(userTopics['الكل']!);
    await FirebaseMessaging.instance
        .unsubscribeFromTopic(userTopics['المسرح']!);
    await FirebaseMessaging.instance
        .unsubscribeFromTopic(userTopics['الأنشطة']!);
  } else if (userModel.currentService == 'وسائل الايضاح') {
    await FirebaseMessaging.instance.unsubscribeFromTopic(userTopics['الكل']!);
    await FirebaseMessaging.instance
        .unsubscribeFromTopic(userTopics['وسائل الايضاح']!);
    await FirebaseMessaging.instance
        .unsubscribeFromTopic(userTopics['الأنشطة']!);
  } else if (userModel.currentService == 'اخوة الرب') {
    await FirebaseMessaging.instance.unsubscribeFromTopic(userTopics['الكل']!);
    await FirebaseMessaging.instance
        .unsubscribeFromTopic(userTopics['اخوة الرب']!);
  } else if (userModel.currentService == 'الكورالات') {
    await FirebaseMessaging.instance.unsubscribeFromTopic(userTopics['الكل']!);
    await FirebaseMessaging.instance
        .unsubscribeFromTopic(userTopics['الكورالات']!);
    await FirebaseMessaging.instance
        .unsubscribeFromTopic(userTopics['الأنشطة']!);
  } else if (userModel.currentService == 'منسقين المهرجان') {
    await FirebaseMessaging.instance.unsubscribeFromTopic(userTopics['الكل']!);
    await FirebaseMessaging.instance
        .unsubscribeFromTopic(userTopics['منسقين المهرجان']!);
  } else if (userModel.currentService == 'الكشافة') {
    await FirebaseMessaging.instance.unsubscribeFromTopic(userTopics['الكل']!);
    await FirebaseMessaging.instance
        .unsubscribeFromTopic(userTopics['الكشافة']!);
    await FirebaseMessaging.instance
        .unsubscribeFromTopic(userTopics['الأنشطة']!);
  } else if (userModel.currentService == 'مركز المشورة') {
    await FirebaseMessaging.instance.unsubscribeFromTopic(userTopics['الكل']!);
    await FirebaseMessaging.instance
        .unsubscribeFromTopic(userTopics['مركز المشورة']!);
  } else if (userModel.currentService == 'مدرسة الشمامسة') {
    await FirebaseMessaging.instance.unsubscribeFromTopic(userTopics['الكل']!);
    await FirebaseMessaging.instance
        .unsubscribeFromTopic(userTopics['مدرسة الشمامسة']!);
  } else if (userModel.currentService == 'كاهن') {
    await FirebaseMessaging.instance.unsubscribeFromTopic(userTopics['الكل']!);
    await FirebaseMessaging.instance.unsubscribeFromTopic(userTopics['كاهن']!);
  }
}
