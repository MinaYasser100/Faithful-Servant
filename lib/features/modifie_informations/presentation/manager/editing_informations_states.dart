part of 'editing_informations_cubit.dart';

@immutable
sealed class EditingInformatinosStates {}

final class EditingInformationsInitial extends EditingInformatinosStates {}

final class EditingInformatinosPickProfileImageSuccess
    extends EditingInformatinosStates {}

final class EditingInformatinosPickProfileImageFailure
    extends EditingInformatinosStates {}

final class EditingInformatinosImageUploadingLoading
    extends EditingInformatinosStates {}

final class EditingInformatinosImageUploadingSuccess
    extends EditingInformatinosStates {}

final class EditingInformatinosImageUploadingFailure
    extends EditingInformatinosStates {}

final class EditingInformatinosUpdateInforamtionsUserLoading
    extends EditingInformatinosStates {}

final class EditingInformatinosUpdateInforamtionsUserSuccess
    extends EditingInformatinosStates {}

final class EditingInformatinosUpdateInforamtionsUserFailure
    extends EditingInformatinosStates {}

final class EditingInformationsChangeAutovalidateMode
    extends EditingInformatinosStates {}
