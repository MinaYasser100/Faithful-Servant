import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/helper/styles.dart';
import 'package:faithful_servant/features/personal/presentation/manager/card_cubit/card_edit_or_show_cubit.dart';
import 'package:faithful_servant/features/personal/presentation/manager/history_of_service_cubit/history_of_service_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowModeHistoryCard extends StatelessWidget {
  const ShowModeHistoryCard({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return FetchHistoryDataSuccessCard(index: index);
  }
}

class FetchHistoryDataSuccessCard extends StatelessWidget {
  const FetchHistoryDataSuccessCard({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Text(
                          'الخدمة: ',
                          style: Styles.textStyle16
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          HistoryOfServiceCubit
                              .dataListHistoryCards[index].service,
                          style: Styles.textStyle16,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'الدور: ',
                          style: Styles.textStyle16
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          HistoryOfServiceCubit
                              .dataListHistoryCards[index].role,
                          style: Styles.textStyle16,
                        )
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Text(
                          'المدة : ',
                          style: Styles.textStyle16
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${HistoryOfServiceCubit.dataListHistoryCards[index].duration} سنوات',
                          style: Styles.textStyle16,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'المكان : ',
                          style: Styles.textStyle16
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          HistoryOfServiceCubit
                              .dataListHistoryCards[index].place,
                          style: Styles.textStyle16,
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        IconButton(
            color: kPrimaryColor,
            onPressed: () {
              BlocProvider.of<CardEditOrShowCubit>(context)
                  .emitEditeMode(index);
            },
            icon: const Icon(Icons.edit)),
        Positioned(
          right: 8,
          top: 8,
          child: CircleAvatar(
            radius: 20,
            backgroundColor: kPrimaryColor,
            child: Text(
              '${index + 1}',
              style: Styles.textStyle16SecondColor
                  .copyWith(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
