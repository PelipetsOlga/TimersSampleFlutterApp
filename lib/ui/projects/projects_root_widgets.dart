import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_sample/domain/repositories/auth_repo.dart';
import 'package:flutter_test_sample/ui/projects/projects_bloc/bloc.dart';
import 'package:flutter_test_sample/ui/projects/projects_list.dart';
import 'package:get_it/get_it.dart';

import '../../domain/repositories/timers_repo.dart';
import '../widgets/empty_widget.dart';
import '../widgets/loading.dart';
import '../widgets/error_widget.dart';

class ProjectsRootWidget extends StatelessWidget {
  const ProjectsRootWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            centerTitle: false,
            title: Text(
              "Projects",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            bottom: TabBar(
              indicatorColor: Colors.white,
              tabs: [
                Tab(
                    icon: Text("Odoo",
                        style: Theme.of(context).textTheme.labelLarge)),
                Tab(
                    icon: Text("Favorites",
                        style: Theme.of(context).textTheme.labelLarge)),
              ],
            ),
          ),
          body: TabBarView(children: [
            BlocProvider<ProjectsBlocNormalMixin>(
                create: (_) => ProjectsBloc(
                      GetIt.instance.get<TimersRepository>(),
                      GetIt.instance.get<AuthRepository>(),
                    ),
                child: _ProjectsContentWidget()),
            BlocProvider<ProjectsBlocFavouritesMixin>(
                create: (_) => ProjectsBloc(
                      GetIt.instance.get<TimersRepository>(),
                      GetIt.instance.get<AuthRepository>(),
                    ),
                child: _ProjectsContentFavWidget())
          ])),
    );
  }
}

class _ProjectsContentWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.read<ProjectsBlocNormalMixin>().add(ProjectsRefresh(favourite: false));
    return BlocBuilder<ProjectsBlocNormalMixin, ProjectsState>(builder: (context, state) {
      return switch (state) {
        ProjectsInitial() => const Center(),
        ProjectsLoading() => const LoadingIndicator(),
        ProjectsError() => ErrorCenterWidget(state.errorMessage),
        ProjectsEmptyLoaded() => EmptyContentWidget.emptyProjects(() {}),
        ProjectsLoaded() => ProjectsListWidget(state.projects, false)
      };
    });
  }
}

class _ProjectsContentFavWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.read<ProjectsBlocFavouritesMixin>().add(ProjectsRefresh(favourite: true));
    return BlocBuilder<ProjectsBlocFavouritesMixin, ProjectsState>(builder: (context, state) {
      return switch (state) {
        ProjectsInitial() => const Center(),
        ProjectsLoading() => const LoadingIndicator(),
        ProjectsError() => ErrorCenterWidget(state.errorMessage),
        ProjectsEmptyLoaded() => EmptyContentWidget.emptyProjects(() {}),
        ProjectsLoaded() => ProjectsListWidget(state.projects, true)
      };
    });
  }
}
