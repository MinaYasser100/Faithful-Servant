import 'package:faithful_servant/features/mine_servant/presentation/manager/mine_servant_cubit/mine_servant_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController mineServantSearchController = TextEditingController();
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: mineServantSearchController,
            textAlign: TextAlign.start,
            decoration: const InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(40)),
              ),
              labelText: 'بحث بالاسم',
            ),
          ),
        ),
        Card(
            elevation: 1.5,
            shape: const CircleBorder(),
            child: IconButton(
                onPressed: () {
                  //search
                  BlocProvider.of<MineServantCubit>(context)
                      .search(searchName: mineServantSearchController.text);
                },
                icon: const Icon(Icons.search)))
      ],
    );
  }
}
