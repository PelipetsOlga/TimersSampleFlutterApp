part of 'bloc.dart';

sealed class TimesheetsDetailsState extends Equatable {
  const TimesheetsDetailsState();

  @override
  List<Object> get props => [];
}

final class TimesheetsInitial extends TimesheetsDetailsState {}

final class TimesheetsLoading extends TimesheetsDetailsState {}

final class TimesheetsEmptyLoaded extends TimesheetsDetailsState {}

final class TimesheetsLoaded extends TimesheetsDetailsState {
  const TimesheetsLoaded({
    required this.timesheetsActive,
    required this.timesheetsCompleted,
  });

  final List<TimeSheetModel> timesheetsActive;
  final List<TimeSheetModel> timesheetsCompleted;

  @override
  List<Object> get props => [timesheetsActive, timesheetsCompleted];
}

final class TimesheetsError extends TimesheetsDetailsState {
  const TimesheetsError(this.errorMessage);

  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];
}
