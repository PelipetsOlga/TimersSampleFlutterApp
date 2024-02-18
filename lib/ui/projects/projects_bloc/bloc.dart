import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_sample/di/di.dart';
import 'package:flutter_test_sample/domain/repositories/auth_repo.dart';

import '../../../domain/models/project.dart';
import '../../../domain/models/errors.dart';
import '../../../domain/repositories/timers_repo.dart';

part 'projects_state.dart';

part 'projects_event.dart';

class ProjectsBloc extends Bloc<ProjectsEvent, ProjectsState>
    with ProjectsBlocFavouritesMixin, ProjectsBlocNormalMixin {
  ProjectsBloc(
    TimersRepository repository,
    AuthRepository authRepository,
  ) : super(ProjectsInitial()) {
    void mapRefreshEventToState(
        ProjectsRefresh event, Emitter<ProjectsState> emit) async {
      emit(ProjectsLoading());

      Either<AppError, List<ProjectModel>> result =
          await repository.getAllProjects(event.favourite);
      result.fold(
          (left) => {emit(ProjectsError(left.msg))},
          (right) => {
                right.isEmpty
                    ? emit(ProjectsEmptyLoaded())
                    : emit(ProjectsLoaded(right))
              });
    }

    void mapLikeEventToState(
        ProjectLike event, Emitter<ProjectsState> emit) async {
      await repository.likeProject(event.like, event.project).then((_) {
        repository.getAllProjects(false).fold(
            (left) => {emit(ProjectsError(left.msg))},
            (right) => {
                  right.isEmpty
                      ? emit(ProjectsEmptyLoaded())
                      : emit(ProjectsLoaded(right))
                });
      });
    }

    on<ProjectsRefresh>(mapRefreshEventToState);
    on<ProjectLike>(mapLikeEventToState);
  }
}

mixin ProjectsBlocFavouritesMixin on Bloc<ProjectsEvent, ProjectsState> {}

mixin ProjectsBlocNormalMixin on Bloc<ProjectsEvent, ProjectsState> {}
