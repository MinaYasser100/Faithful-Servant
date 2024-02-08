import 'package:bloc/bloc.dart';
import 'package:faithful_servant/core/function/get_user_data.dart';
import 'package:faithful_servant/core/function/getting_total_count_of_users.dart';
import 'package:faithful_servant/core/helper/styles.dart';
import 'package:faithful_servant/features/register/data/model/user_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'pie_chart_state.dart';

class PieChartCubit extends Cubit<PieChartState> {
  PieChartCubit() : super(PieChartFetshDataLoading());

  late List<PieChartSectionData> piechartdata;
  late int totalcount;
  late int malecount;
  late int femalecount;
  getingDataFromFirebase() async {
    UserModel? usermodel = await getUserData();
    if (usermodel != null) {
      try {
        malecount = await gettingcountOfUsersBasedOnFilter(
            filterKey: "gender", filtetrValue: "ذكر", user: usermodel);
        femalecount = await gettingcountOfUsersBasedOnFilter(
            filterKey: "gender", filtetrValue: "انثي", user: usermodel);
        totalcount = malecount + femalecount;
        piechartdata = [
          PieChartSectionData(
            color: Colors.amber,
            value: (malecount / totalcount) * 100,
            title: '%${((malecount / totalcount) * 100).round()} ',
            titleStyle: Styles.textStyle16,
          ),
          PieChartSectionData(
            color: Colors.blue,
            value: (femalecount / totalcount) * 100,
            title: '%${((femalecount / totalcount) * 100).round()}',
            titleStyle: Styles.textStyle16,
          )
        ];
        emit(PieChartFetshDataSuccess());
      } catch (e) {
        emit(PieChartFetshDatafailed());
      }
    } else {
      emit(PieChartFetshDatafailed());
    }
  }
}
