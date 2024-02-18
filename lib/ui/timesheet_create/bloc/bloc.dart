import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_sample/data/data_utils.dart';
import 'package:flutter_test_sample/domain/repositories/auth_repo.dart';

import '../../../domain/models/errors.dart';
import '../../../domain/models/project.dart';
import '../../../domain/models/task.dart';
import '../../../domain/models/time_sheet.dart';
import '../../../domain/repositories/timers_repo.dart';

part 'timer_create_event.dart';

part 'timer_create_state.dart';

class TimerCreateBloc extends Bloc<TimerCreateEvent, TimerCreateState> {
  TimerCreateBloc(TimersRepository repository, AuthRepository authRepository)
      : super(TimerCreateInitial()) {
    void mapRefreshEventToState(
        TimerCreateFetch event, Emitter<TimerCreateState> emit) async {
      emit(TimerCreateLoading());

      Either<AppError, List<ProjectModel>> result =
          await repository.getAllProjects(false);
      result.fold(
        (left) => {emit(const TimerCreateLoaded([]))},
        (right) => {emit(TimerCreateLoaded(right))},
      );
    }

    void mapTimesheetLikeEventToState(
        TimerCreateDo event, Emitter<TimerCreateState> emit) async {
      await repository.createTimer(TimeSheetModel.create(
        id: generateId(),
        userId: authRepository.profile().id,
        description: event.description,
        project: event.project,
        task: event.task,
        favourite: event.like,
      )).then((_) {
        emit( TimerCreateCreated());
      });
    }

    on<TimerCreateFetch>(mapRefreshEventToState);
    on<TimerCreateDo>(mapTimesheetLikeEventToState);
  }
}
