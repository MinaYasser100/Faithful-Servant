part of 'general_manager_cubit.dart';

@immutable
sealed class GeneralManagerState {}

final class GeneralManagerInitial extends GeneralManagerState {}

final class Generalquicksummaryloading extends GeneralManagerState {}

final class Generalquicksummarysuccess extends GeneralManagerState {}

final class Generalquicksummaryfailed extends GeneralManagerState {}
