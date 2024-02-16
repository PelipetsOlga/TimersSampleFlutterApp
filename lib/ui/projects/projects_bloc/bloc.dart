import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/models/project.dart';
import '../../../domain/models/errors.dart';
import '../../../domain/repositories/timers_repo.dart';

part 'projects_state.dart';

part 'projects_event.dart';

class ProjectsBloc extends Bloc<ProjectsEvent, ProjectsState> {
  ProjectsBloc(TimersRepository repository) : super(ProjectsInitial()) {
    on<ProjectsRefresh>((event, emit) async {
      emit(ProjectsLoading());
      Either<AppError, List<ProjectModel>> result =
          await repository.getAllProjects(false);
      result.fold(
          (left) => {emit(ProjectsError(left.msg))},
          (right) => {
                right.isEmpty
                    ? emit(ProjectsEmptyLoaded())
                    : emit(ProjectsLoaded(right))
              });
    });
  }
}
