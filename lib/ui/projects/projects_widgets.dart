import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_sample/ui/projects/projects_bloc/bloc.dart';
import 'package:flutter_test_sample/ui/projects/projects_list.dart';
import 'package:get_it/get_it.dart';

import '../../domain/repositories/timers_repo.dart';
import '../widgets/menu_button.dart';

class ProjectsWidget extends StatelessWidget {
  const ProjectsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => ProjectsBloc(GetIt.instance.get<TimersRepository>()),
        child: Scaffold(
            appBar: AppBar(
              centerTitle: false,
              title: Text(
                "Projects",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            body: const _ProjectsContentWidget()));
  }
}

class _ProjectsContentWidget extends StatelessWidget {
  const _ProjectsContentWidget();

  @override
  Widget build(BuildContext context) {
    context.read<ProjectsBloc>().add(ProjectsRefresh());
    return BlocBuilder<ProjectsBloc, ProjectsState>(builder: (context, state) {
      return switch (state) {
        ProjectsInitial() => const Text('Initial state'),
        ProjectsLoading() => const Text('Loading'),
        ProjectsError() => Text("Error ${state.errorMessage}"),
        ProjectsEmptyLoaded() => const Text("Loaded 0 items"),
        ProjectsLoaded() => ProjectsListWidget(state.projects)
      };
    });
  }
}
