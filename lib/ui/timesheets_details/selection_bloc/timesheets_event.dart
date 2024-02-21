part of 'bloc.dart';

sealed class TimesheetsDetailsEvent extends Equatable {
  const TimesheetsDetailsEvent();

  @override
  List<Object> get props => [];
}

final class TimesheetInit extends TimesheetsDetailsEvent {}

final class TimesheetsSelect extends TimesheetsDetailsEvent {
  TimeSheetModel timesheet;

  TimesheetsSelect(this.timesheet);

  @override
  List<Object> get props => [timesheet];
}
