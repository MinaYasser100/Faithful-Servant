part of 'statistics_cubit.dart';

@immutable
sealed class StatisticsState {}

final class StatisticsInitial extends StatisticsState {}

final class StatisticsLoading extends StatisticsState {}

final class StatisticsFailure extends StatisticsState {}

final class StatisticsDeaconsSchoolSuccess extends StatisticsState {}

final class StatisticsNumberByGenderLoading extends StatisticsState {}

final class StatisticsNumberByGendersuccess extends StatisticsState {}

final class StatisticsNumberByGenderFailure extends StatisticsState {}
