part of 'bloc.dart';

sealed class TimesheetsEvent extends Equatable {
  const TimesheetsEvent();

  @override
  List<Object> get props => [];
}

final class TimesheetsRefresh extends TimesheetsEvent {}

final class TimesheetsLike extends TimesheetsEvent {
  String timesheetId;
  bool like;

  TimesheetsLike({
    required this.timesheetId,
    required this.like,
  });

  @override
  List<Object> get props => [timesheetId, like];
}
