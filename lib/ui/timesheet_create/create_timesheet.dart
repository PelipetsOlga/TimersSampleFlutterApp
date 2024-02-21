import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_sample/domain/repositories/auth_repo.dart';
import 'package:flutter_test_sample/ui/timesheet_create/timer_create_content.dart';
import 'package:get_it/get_it.dart';

import '../../domain/repositories/timers_repo.dart';
import '../widgets/go_back.dart';
import '../widgets/loading.dart';
import 'bloc/bloc.dart';

class CreateTimer extends StatelessWidget {
  const CreateTimer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TimerCreateBloc(GetIt.instance.get<TimersRepository>(),
          GetIt.instance.get<AuthRepository>()),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back_ios)),
          title: Text(
            "Create Timer",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        body: const _CreateTimerWidget(),
      ),
    );
  }
}

class _CreateTimerWidget extends StatelessWidget {
  const _CreateTimerWidget();

  @override
  Widget build(BuildContext context) {
    context.read<TimerCreateBloc>().add(TimerCreateFetch());
    return BlocBuilder<TimerCreateBloc, TimerCreateState>(
        builder: (context, state) {
      return switch (state) {
        TimerCreateInitial() => const Center(),
        TimerCreateLoading() => const LoadingIndicator(),
        TimerCreateLoaded() => CreateTimerContentWidget(state.projects),
        TimerCreateCreated() => const GoBackWidget(),
      };
    });
  }
}
