import 'package:faithful_servant/features/ma5domeen/presentation/view/search/presentation/manager/cubit/ma5domeen_search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'ma5domeen_seach_body_bloc_builder.dart';

class Ma5domeenSearchBodyView extends StatefulWidget {
  const Ma5domeenSearchBodyView({super.key, required this.stageName});
  final String stageName;

  @override
  State<Ma5domeenSearchBodyView> createState() =>
      _Ma5domeenSearchBodyViewState();
}

class _Ma5domeenSearchBodyViewState extends State<Ma5domeenSearchBodyView> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: TextFormField(
            controller: searchController,
            onChanged: (value) {
              context
                  .read<Ma5domeenSearchCubit>()
                  .searchInMa5domeen(query: value);
            },
            decoration: InputDecoration(
              hintText: 'Search here...'.tr,
              suffixIcon: const Icon(Icons.search_rounded),
            ),
          ),
        ),
        Ma5domeenSearchBodyBlocBuilder(
          searchController: searchController,
          widget: widget,
        ),
      ],
    );
  }
}
