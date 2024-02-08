import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'card_edit_or_show_state.dart';

class CardEditOrShowCubit extends Cubit<CardEditOrShowState> {
  CardEditOrShowCubit() : super(CardEditOrShowInitial());

  void emitEditeMode(int index) {
    emit(CardEdit(index: index));
  }

  void emitShowMode() {
    emit(Cardshow());
  }
}
