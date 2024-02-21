part of 'bloc.dart';

sealed class TimesheetsDetailsEvent extends Equatable {
  const TimesheetsDetailsEvent();

  @override
  List<Object> get props => [];
}

final class TimesheetsRefresh extends TimesheetsDetailsEvent {}
