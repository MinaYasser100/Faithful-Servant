import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/features/ma5domeen/presentation/manager/ma5domeen_cubit.dart';
import 'package:faithful_servant/features/ma5domeen/presentation/manager/ma5domeen_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Ma5domeenBody extends StatelessWidget {
  const Ma5domeenBody({super.key, required this.nameStage});
  final String nameStage;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Ma5domeenCubit, Ma5domeenStates>(
      builder: (context, state) {
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: ma5domeenData.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(ma5domeenData[index].name),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
