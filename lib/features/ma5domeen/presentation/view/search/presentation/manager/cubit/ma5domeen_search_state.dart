part of 'ma5domeen_search_cubit.dart';

sealed class Ma5domeenSearchState {}

final class Ma5domeenSearchInitial extends Ma5domeenSearchState {}

final class Ma5domeenSearchCubitGetMa5domeenDataSuccess
    extends Ma5domeenSearchState {}

final class Ma5domeenSearchCubitGetMa5domeenDataFailure
    extends Ma5domeenSearchState {}

final class Ma5domeenSearchCubitSuccess extends Ma5domeenSearchState {
  final List<Ma5domeenModel> resultList;

  Ma5domeenSearchCubitSuccess({required this.resultList});
}
