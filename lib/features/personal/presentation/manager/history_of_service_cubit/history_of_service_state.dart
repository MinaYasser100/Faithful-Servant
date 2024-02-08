part of 'history_of_service_cubit.dart';

@immutable
sealed class HistoryOfServiceState {}

final class HistoryOfServiceInitial extends HistoryOfServiceState {}

final class Selectedelseplace extends HistoryOfServiceState {}

final class EditModeCard extends HistoryOfServiceState {}

final class EditModeCardLoading extends HistoryOfServiceState {}

final class EditModeCardsuccess extends HistoryOfServiceState {}

final class EditModeCardfailur extends HistoryOfServiceState {}

final class Fetchhistorydataloading extends HistoryOfServiceState {}

final class Fetchhistorydatasuccess extends HistoryOfServiceState {}

final class Fetchhistorydatafailure extends HistoryOfServiceState {}
