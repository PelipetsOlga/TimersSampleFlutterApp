part of 'bloc.dart';

sealed class TimesheetsState extends Equatable {
  const TimesheetsState();

  @override
  List<Object> get props => [];
}

final class TimesheetsInitial extends TimesheetsState {}

final class TimesheetsLoading extends TimesheetsState {}

final class TimesheetsEmptyLoaded extends TimesheetsState {}

final class TimesheetsLoaded extends TimesheetsState {
  const TimesheetsLoaded(this.timesheets);

  final List<TimeSheetModel> timesheets;

  @override
  List<Object> get props => [timesheets];
}

final class TimesheetsError extends TimesheetsState {
  const TimesheetsError(this.errorMessage);

  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];
}
