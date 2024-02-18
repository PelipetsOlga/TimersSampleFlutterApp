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
    return BlocProvider(
        create: (_) => ProjectsBloc(
              GetIt.instance.get<TimersRepository>(),
              GetIt.instance.get<AuthRepository>(),
            ),
        child: DefaultTabController(
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
              body: const TabBarView(children: [
                _ProjectsContentWidget(false),
                _ProjectsContentWidget(true)
              ])),
        ));
  }
}

class _ProjectsContentWidget extends StatelessWidget {
  final bool favourites;

  const _ProjectsContentWidget(this.favourites);

  @override
  Widget build(BuildContext context) {
    context.read<ProjectsBloc>().add(ProjectsRefresh(favorites: favourites));
    return BlocBuilder<ProjectsBloc, ProjectsState>(builder: (context, state) {
      return switch (state) {
        ProjectsInitial() => const Center(),
        ProjectsLoading() => const LoadingIndicator(),
        ProjectsError() => ErrorCenterWidget(state.errorMessage),
        ProjectsEmptyLoaded() => EmptyContentWidget.emptyProjects(() {}),
        ProjectsLoaded() => ProjectsListWidget(state.projects)
      };
    });
  }
}
