import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/helper/styles.dart';
import 'package:faithful_servant/core/widgets/loading_indicator.dart';
import 'package:faithful_servant/features/mine_servant/presentation/manager/mine_servant_cubit/mine_servant_cubit.dart';
import 'package:faithful_servant/features/mine_servant/presentation/views/widgets/search_field.dart';
import 'package:faithful_servant/features/mine_servant/presentation/views/widgets/servant_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'mine_servant_empty_widget.dart';

class MineServantBody extends StatelessWidget {
  const MineServantBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MineServantCubit()..init(),
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: kSecondColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(bodyRadious),
            topRight: Radius.circular(bodyRadious),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SearchField(),
            const SizedBox(height: 10),
            BlocBuilder<MineServantCubit, MineServantState>(
              builder: (context, state) {
                if (state is MineServantFetchDataLoading ||
                    state is MineServantSearchDataLoading) {
                  return const LoadingIndicator();
                } else if (state is MineServantFetchDataSuccess &&
                    searchServantList.isEmpty) {
                  return const MineServantEmptyWidget();
                } else if (state is MineServantFetchDataSuccess &&
                    searchServantList.isNotEmpty) {
                  return ServantList(filteredList: searchServantList);
                } else if (state is MineServantFetchDataFalure) {
                  return Center(
                      child: Text(
                    'خطا في الاتصال بالسيرفر',
                    style: Styles.textStyle16.copyWith(color: Colors.red[900]),
                  ));
                } else if (state is MineServantSearchDataSuccess) {
                  return ServantList(
                      filteredList: searchServantListSearchResult);
                } else {
                  return const SizedBox();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
