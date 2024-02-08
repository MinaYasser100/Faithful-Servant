import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/features/personal/presentation/manager/card_cubit/card_edit_or_show_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonsOfEditModeHistoryCard extends StatelessWidget {
  const ButtonsOfEditModeHistoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: CircleAvatar(
            backgroundColor: kPrimaryColor,
            child: IconButton(
                color: kSecondColor,
                onPressed: () {
                  BlocProvider.of<CardEditOrShowCubit>(context).emitShowMode();
                },
                icon: const Icon(Icons.close)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: CircleAvatar(
            backgroundColor: kPrimaryColor,
            child: IconButton(
                color: kSecondColor,
                onPressed: () {
                  //BlocProvider.of<HistoryOfServiceCubit>(context).editExistServiceInHistory(data: null, context: context);
                },
                icon: const Icon(Icons.send)),
          ),
        ),
      ],
    );
  }
}
