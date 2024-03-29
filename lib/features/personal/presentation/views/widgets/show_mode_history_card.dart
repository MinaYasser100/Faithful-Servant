import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/helper/styles.dart';
import 'package:faithful_servant/features/personal/data/repos/services_history_repo_implementation.dart';
import 'package:faithful_servant/features/personal/presentation/manager/history_of_service_cubit/history_of_service_cubit.dart';
import 'package:faithful_servant/features/personal/presentation/views/widgets/bottom_sheet_of_adding_service_history.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15),
        CircleAvatar(
          radius: 20,
          backgroundColor: kPrimaryColor,
          child: Text(
            '${index + 1}',
            style: Styles.textStyle16SecondColor
                .copyWith(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Stack(
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
                  BlocProvider.of<HistoryOfServiceCubit>(context).editinitdata(
                      data: HistoryOfServiceCubit.dataListHistoryCards[index]);
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return BlocProvider(
                        create: (context) => HistoryOfServiceCubit(
                            ServiceHistoryImplementaion()),
                        child: BottomSheetOfAddingOrEditingServiceHistory(
                          data:
                              HistoryOfServiceCubit.dataListHistoryCards[index],
                          index: index,
                          edit: true,
                        ),
                      );
                    },
                  );
                },
                icon: const Icon(Icons.edit)),
          ],
        ),
      ],
    );
  }
}
