import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:faithful_servant/core/function/get_user_data.dart';
import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/features/register/data/model/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'mine_servant_state.dart';

class MineServantCubit extends Cubit<MineServantState> {
  MineServantCubit() : super(MineServantInitial());

  void init() async {
    searchServantList.clear();
    try {
      emit(MineServantFetchDataLoading());
      UserModel? userdata = await getUserData();
      if (userdata != null) {
        if (userdata.privilage == 'امين الخدمة') {
          // the current user is امين خدمة
          await FirebaseFirestore.instance
              .collection(churchNamesBasedOnCode[userdata.church])
              .doc(userdata.church)
              .collection('users')
              .where('privilage', isEqualTo: 'خادم')
              .where('currentService', isEqualTo: userdata.currentService)
              //.where("name", isNotEqualTo: userdata.name)
              .get()
              .then((value) {
            for (var element in value.docs) {
              searchServantList.add(UserModel.fromJson(element.data()));
            }
          });
        } else if (userdata.privilage == 'امين قطاع' &&
            userdata.currentService == "ابتدائي") {
          // the current user is امين قطاع
          await FirebaseFirestore.instance
              .collection(churchNamesBasedOnCode[userdata.church])
              .doc(userdata.church)
              .collection('users')
              .where('currentService', whereIn: ['ابتدائي', 'كيجي'])
              .get()
              .then((value) {
                for (var element in value.docs) {
                  searchServantList.add(UserModel.fromJson(element.data()));
                }
              });
        } else if (userdata.privilage == 'امين قطاع' &&
            userdata.currentService == 'اعدادي و ثانوي') {
          // the current user is امين قطاع
          await FirebaseFirestore.instance
              .collection(churchNamesBasedOnCode[userdata.church])
              .doc(userdata.church)
              .collection('users')
              .where('currentService', whereIn: ['اعدادي', 'ثانوي'])
              .get()
              .then((value) {
                for (var element in value.docs) {
                  searchServantList.add(UserModel.fromJson(element.data()));
                }
              });
        } else if (userdata.privilage == "المشرف العام") {
          // the current user is مشرف عام
          if (userdata.currentService == 'كاهن') {
            // ايميل كاهن
            await FirebaseFirestore.instance
                .collection(churchNamesBasedOnCode[userdata.church])
                .doc(userdata.church)
                .collection('users')
                .where("currentService", isNotEqualTo: 'كاهن')
                // .where("name", isNotEqualTo: userdata.name)
                .get()
                .then((value) {
              for (var element in value.docs) {
                searchServantList.add(UserModel.fromJson(element.data()));
              }
            });
          } else {
            // ايميل امين الخدمة او المساعد
            await FirebaseFirestore.instance
                .collection(churchNamesBasedOnCode[userdata.church])
                .doc(userdata.church)
                .collection('users')
                .where('currentService', isNotEqualTo: 'كاهن')
                // .where("name", isNotEqualTo: userdata.name)
                .get()
                .then((value) {
              for (var element in value.docs) {
                searchServantList.add(UserModel.fromJson(element.data()));
              }
            });
          }
        }
        searchServantList = searchServantList
            .where((servnat) => servnat.isActive == true)
            .toList();
        searchServantList
            .sort((a, b) => a.privilage.length.compareTo(b.privilage.length));
        emit(MineServantFetchDataSuccess());
      }
    } on Exception {
      emit(MineServantFetchDataFalure());
    }
  }

  void search({required String searchName}) {
    searchServantListSearchResult.clear();
    emit(MineServantSearchDataLoading());
    for (var element in searchServantList) {
      if (element.name.contains(searchName)) {
        searchServantListSearchResult.add(element);
      } else {
        continue;
      }
    }
    emit(MineServantSearchDataSuccess());
  }
}
