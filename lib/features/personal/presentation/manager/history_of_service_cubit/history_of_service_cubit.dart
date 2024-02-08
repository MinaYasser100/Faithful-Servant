import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'history_of_service_state.dart';

class HistoryOfServiceCubit extends Cubit<HistoryOfServiceState> {
  HistoryOfServiceCubit() : super(HistoryOfServiceInitial());

  void emitelesplace() {
    emit(Selectedelseplace());
  }

  void emitini() {
    emit(HistoryOfServiceInitial());
  }
}
