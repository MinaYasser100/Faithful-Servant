part of 'statistics_cubit.dart';

@immutable
sealed class StatisticsState {}

final class StatisticsInitial extends StatisticsState {}

final class StatisticsLoading extends StatisticsState {}

final class StatisticsKG1Success extends StatisticsState {}

final class StatisticsKG2Success extends StatisticsState {}
