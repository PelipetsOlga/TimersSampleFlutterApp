import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/models/time_sheet.dart';
import '../../../domain/repositories/timers_repo.dart';

part 'timesheets_state.dart';

part 'timesheets_event.dart';

class TimesheetsDetailsBloc
    extends Bloc<TimesheetsDetailsEvent, TimesheetsDetailsState> {
  TimesheetsDetailsBloc(TimersRepository repository)
      : super(TimesheetsInitial()) {
    void mapRefreshEventToState(
        TimesheetsRefresh event, Emitter<TimesheetsDetailsState> emit) async {
      emit(TimesheetsLoading());

      var result = await repository.getTimeSheets();
      result.fold(
          (left) => {emit(TimesheetsError(left.msg))},
          (right) => {
                emit(TimesheetsLoaded(
                    timesheetsActive: right.value,
                    timesheetsCompleted: right.key))
              });
    }

    on<TimesheetsRefresh>(mapRefreshEventToState);
  }
}
