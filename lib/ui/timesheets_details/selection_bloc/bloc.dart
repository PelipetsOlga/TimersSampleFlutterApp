import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/models/time_sheet.dart';

part 'timesheets_state.dart';

part 'timesheets_event.dart';

class TimesheetSelectedBloc
    extends Bloc<TimesheetsDetailsEvent, TimesheetDetailsState> {
  TimesheetSelectedBloc() : super(TimesheetEmpty()) {
    void mapSelectEventToState(
        TimesheetsSelect event, Emitter<TimesheetDetailsState> emit) async {
      emit(TimesheetLoaded(timesheet: event.timesheet));
    }

    void mapTimesheetInitToState(
        TimesheetInit event, Emitter<TimesheetDetailsState> emit) async {
      emit(TimesheetEmpty());
    }

    on<TimesheetsSelect>(mapSelectEventToState);
    on<TimesheetInit>(mapTimesheetInitToState);
  }
}
