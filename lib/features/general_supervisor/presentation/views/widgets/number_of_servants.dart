import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/helper/styles.dart';
import 'package:faithful_servant/features/general_supervisor/presentation/manager/general_supervisor_cubit/general_supervisor_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NumberOfServants extends StatelessWidget {
  const NumberOfServants({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Center(
            child: Column(
              children: [
                const Text('عدد الخدام بالخدمة',
                    style: Styles.textStyle16SecondColor),
                BlocBuilder<GeneralSupervisorCubit, GeneralSupervisorState>(
                  builder: (context, state) {
                    if (state is GeneralSupervisorGetNumberOfServantLoading) {
                      return const Center(
                          child: Padding(
                        padding: EdgeInsets.all(5.0),
                        child: CircularProgressIndicator(
                          color: kSecondColor,
                        ),
                      ));
                    } else if (state
                        is GeneralSupervisorGetNumberOfGeneralServantSuccess) {
                      return Text(
                          BlocProvider.of<GeneralSupervisorCubit>(context)
                              .total
                              .toString(),
                          style: Styles.textStyle30SecondColor);
                    } else {
                      return const Text('No Number',
                          style: Styles.textStyle30SecondColor);
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
