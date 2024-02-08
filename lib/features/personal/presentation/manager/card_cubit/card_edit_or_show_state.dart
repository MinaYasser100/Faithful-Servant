part of 'card_edit_or_show_cubit.dart';

sealed class CardEditOrShowState extends Equatable {
  const CardEditOrShowState();

  @override
  List<Object> get props => [];
}

final class CardEditOrShowInitial extends CardEditOrShowState {}

final class Cardshow extends CardEditOrShowState {}

final class CardEdit extends CardEditOrShowState {
  final int index;

  const CardEdit({required this.index});
}
