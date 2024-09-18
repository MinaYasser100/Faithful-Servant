import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'ma5domeen_search_state.dart';

class Ma5domeenSearchCubit extends Cubit<Ma5domeenSearchState> {
  Ma5domeenSearchCubit() : super(Ma5domeenSearchInitial());
}
