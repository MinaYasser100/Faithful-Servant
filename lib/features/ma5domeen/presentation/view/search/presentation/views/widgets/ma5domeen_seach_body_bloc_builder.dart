import 'package:faithful_servant/core/helper/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../manager/cubit/ma5domeen_search_cubit.dart';
import 'ma5domeen_search_body_view.dart';
import 'ma5domeen_search_content_bady.dart';

class Ma5domeenSearchBodyBlocBuilder extends StatelessWidget {
  const Ma5domeenSearchBodyBlocBuilder({
    super.key,
    required this.searchController,
    required this.widget,
  });

  final TextEditingController searchController;
  final Ma5domeenSearchBodyView widget;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Ma5domeenSearchCubit, Ma5domeenSearchState>(
        builder: (context, state) {
      if (state is Ma5domeenSearchCubitSuccess &&
          searchController.text == '' &&
          state.resultList.isNotEmpty) {
        return const SizedBox();
      } else if (state is Ma5domeenSearchCubitSuccess &&
          state.resultList.isNotEmpty) {
        return Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            itemCount: state.resultList.length,
            itemBuilder: (context, index) {
              return Ma5domeenSearchContentBady(
                stageName: widget.stageName,
                ma5domeenModel: state.resultList[index],
                onPressed: () async {
                  await context.read<Ma5domeenSearchCubit>().deleteMa5doom(
                        stageName: widget.stageName,
                        ma5domId: state.resultList[index].id,
                        query: searchController.text,
                      );
                  Get.back();
                },
              );
            },
          ),
        );
      } else if (state is Ma5domeenSearchCubitSuccess &&
          state.resultList.isEmpty) {
        return Text(
          'There no one have this name'.tr,
          style: Styles.textStyle20PrimaryColor,
        );
      } else {
        return const SizedBox();
      }
    });
  }
}
