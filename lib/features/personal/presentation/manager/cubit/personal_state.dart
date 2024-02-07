part of 'personal_cubit.dart';

@immutable
sealed class PersonalState {}

final class PersonalPersonaldatafetchloading extends PersonalState {}

final class PersonalPersonaldatafetchsuccess extends PersonalState {}

final class PersonalPersonaldatafetchfailed extends PersonalState {}
