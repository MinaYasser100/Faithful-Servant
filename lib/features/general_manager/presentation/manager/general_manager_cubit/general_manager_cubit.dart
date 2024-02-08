import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faithful_servant/core/function/get_user_data.dart';
import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/features/register/data/model/user_model.dart';
import 'package:meta/meta.dart';

part 'general_manager_state.dart';

class GeneralManagerCubit extends Cubit<GeneralManagerState> {
  GeneralManagerCubit() : super(GeneralManagerInitial());
  late int total;
  void quickSummary() async {
    emit(Generalquicksummaryloading());
    UserModel? user = await getUserData();
    if (user != null) {
      try {
        await FirebaseFirestore.instance
            .collection(churchNamesBasedOnCode[user.church])
            .doc(user.church)
            .collection('users')
            .where('currentService', isEqualTo: user.currentService)
            .where('privilage', isEqualTo: 'خادم')
            .get()
            .then((value) {
          total = value.docs.length;
        });
        emit(Generalquicksummarysuccess());
      } catch (e) {
        emit(Generalquicksummaryfailed());
      }
    } else {
      emit(Generalquicksummaryfailed());
    }
  }
}
