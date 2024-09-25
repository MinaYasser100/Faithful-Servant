import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'all_servants_states.dart';

class AllServantsCubit extends Cubit<AllServantsStates> {
  AllServantsCubit() : super(AllServantsCuibtInitial());

  Future<void> getAllServant() async {}
}
