part of 'statistics_cubit.dart';

@immutable
sealed class StatisticsState {}

final class StatisticsInitial extends StatisticsState {}

final class StatisticsKgLoading extends StatisticsState {}

final class StatisticsLoading extends StatisticsState {}

final class StatisticsSuccess extends StatisticsState {}

final class StatisticsPrimarySuccess extends StatisticsState {}

final class StatisticsKG2Success extends StatisticsState {}

final class StatisticsPrimary1Loading extends StatisticsState {}

final class StatisticsPrimary1Success extends StatisticsState {}

final class StatisticsPrimary1Failure extends StatisticsState {}

final class StatisticsPrimary2Success extends StatisticsState {}

final class StatisticsPrimary3Success extends StatisticsState {}

final class StatisticsPrimary4Success extends StatisticsState {}

final class StatisticsPrimary5Success extends StatisticsState {}

final class StatisticsPrimary6Success extends StatisticsState {}

final class StatisticsPerparatoryGirlsSuccess extends StatisticsState {}

final class StatisticsPerparatoryBoysSuccess extends StatisticsState {}

final class StatisticsSecondaryGirlsSuccess extends StatisticsState {}

final class StatisticsSecondaryBoysSuccess extends StatisticsState {}
