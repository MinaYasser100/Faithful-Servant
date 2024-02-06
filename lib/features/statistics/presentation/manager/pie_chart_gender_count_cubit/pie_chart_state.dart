part of 'pie_chart_cubit.dart';

@immutable
sealed class PieChartState {}

final class PieChartFetshDataLoading extends PieChartState {}

final class PieChartFetshDataSuccess extends PieChartState {}

final class PieChartFetshDatafailed extends PieChartState {}
