part of 'mine_servant_cubit.dart';

sealed class MineServantState extends Equatable {
  const MineServantState();

  @override
  List<Object> get props => [];
}

final class MineServantInitial extends MineServantState {}

final class MineServantFetchDataLoading extends MineServantState {}

final class MineServantFetchDataSuccess extends MineServantState {}

final class MineServantFetchDataFalure extends MineServantState {}

final class MineServantSearchDataSuccess extends MineServantState {}

final class MineServantSearchDataLoading extends MineServantState {}
