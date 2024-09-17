import 'package:faithful_servant/features/ma5domeen/data/model/ma5domeen_model.dart';
import 'package:faithful_servant/features/ma5domeen/presentation/manager/ma5domeen_cubit.dart';
import 'package:faithful_servant/features/ma5domeen/presentation/manager/ma5domeen_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Ma5domeenBody extends StatefulWidget {
   const Ma5domeenBody({super.key, required this.nameStage});
  final String nameStage;
  @override
  State<Ma5domeenBody> createState() => _Ma5domeenBodyState();
}

class _Ma5domeenBodyState extends State<Ma5domeenBody> {
late Stream<List<Ma5domeenModel>> ma5domeenData;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Ma5domeenCubit, Ma5domeenStates>(
      builder: (context, state) {
        if(state is GetMa5domeenDataSuccess){
         ma5domeenData=state.ma5domeenData1 as Stream<List<Ma5domeenModel>>;

        }
        return StreamBuilder<List<Ma5domeenModel>>(
          builder: (context,  ma5domeenData) {
            return ListView.builder(
              itemCount:ma5domeenData.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text({ma5domeenData} as String),
                );
              },
            );
          }, stream: ,
        );
      },
    );
  }
}
