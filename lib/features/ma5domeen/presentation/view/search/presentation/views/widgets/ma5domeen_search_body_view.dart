import 'package:faithful_servant/core/helper/styles.dart';
import 'package:faithful_servant/features/ma5domeen/presentation/view/search/presentation/manager/cubit/ma5domeen_search_cubit.dart';
import 'package:faithful_servant/features/ma5domeen/presentation/view/search/presentation/views/widgets/ma5domeen_search_content_bady.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

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
        BlocBuilder<Ma5domeenSearchCubit, Ma5domeenSearchState>(
            builder: (context, state) {
          if (state is Ma5domeenSearchCubitSuccess &&
              searchController.text == '' &&
              state.resultList.isNotEmpty) {
            return const SizedBox();
          } else if (state is Ma5domeenSearchCubitSuccess &&
              state.resultList.isNotEmpty) {
            return Expanded(
              child: ListView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                itemCount: state.resultList.length,
                itemBuilder: (context, index) {
                  return Ma5domeenSearchContentBady(
                    stageName: widget.stageName,
                    ma5domeenModel: state.resultList[index],
                  );
                },
              ),
            );
          } else if (state is Ma5domeenSearchCubitSuccess &&
              state.resultList.isEmpty) {
            return const Text(
              'There no one have this name',
              style: Styles.textStyle20PrimaryColor,
            );
          } else {
            return const SizedBox();
          }
        }),
      ],
    );
  }
}
