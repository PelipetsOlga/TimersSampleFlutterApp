import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_sample/di/di.dart';

import '../../../domain/models/errors.dart';
import '../../../domain/models/time_sheet.dart';
import '../../../domain/repositories/timers_repo.dart';

part 'timesheets_state.dart';

part 'timesheets_event.dart';

class TimesheetsBloc extends Bloc<TimesheetsEvent, TimesheetsState> {
  TimesheetsBloc(TimersRepository repository) : super(TimesheetsInitial()) {
    void mapRefreshEventToState(
        TimesheetsRefresh event, Emitter<TimesheetsState> emit) async {
      emit(TimesheetsLoading());

      Either<AppError, List<TimeSheetModel>> result =
          await repository.getAllTimeSheets();
      logger.d("bloc refresh timesheets=${result.right}");
      result.fold(
          (left) => {emit(TimesheetsError(left.msg))},
          (right) => {
                right.isEmpty
                    ? emit(TimesheetsEmptyLoaded())
                    : emit(TimesheetsLoaded(right))
              });
    }

    void mapTimesheetLikeEventToState(
        TimesheetsLike event, Emitter<TimesheetsState> emit) async {
      await repository.likeTimesheet(event.like, event.timesheetId).then((_) {
        repository.getAllTimeSheets().fold(
            (left) => {emit(TimesheetsError(left.msg))},
            (right) => {
                  right.isEmpty
                      ? emit(TimesheetsEmptyLoaded())
                      : emit(TimesheetsLoaded(right))
                });
      });
    }

    on<TimesheetsRefresh>(mapRefreshEventToState);
    on<TimesheetsLike>(mapTimesheetLikeEventToState);
  }
}
