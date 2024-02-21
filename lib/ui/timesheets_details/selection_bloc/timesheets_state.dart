part of 'bloc.dart';

sealed class TimesheetDetailsState extends Equatable {
  const TimesheetDetailsState();

  @override
  List<Object> get props => [];
}

final class TimesheetEmpty extends TimesheetDetailsState {}

final class TimesheetLoaded extends TimesheetDetailsState {
  const TimesheetLoaded({
    required this.timesheet,
  });

  final TimeSheetModel timesheet;

  @override
  List<Object> get props => [timesheet];
}
