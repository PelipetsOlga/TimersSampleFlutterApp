import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_sample/ui/timesheets/timesheets_bloc/bloc.dart';
import 'package:flutter_test_sample/ui/timesheets/timesheets_widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../../domain/repositories/timers_repo.dart';
import '../widgets/empty_widget.dart';
import '../widgets/loading.dart';
import '../widgets/error_widget.dart';
import '../widgets/menu_button.dart';

class TimesheetsRootWidget extends StatelessWidget {
  TimesheetsRootWidget({super.key});
  TimesheetsBloc bloc = TimesheetsBloc(GetIt.instance.get<TimersRepository>());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => bloc,
        child: Scaffold(
            appBar: AppBar(
              centerTitle: false,
              actions: <Widget>[
                MenuButton.plus(onPressed: () async {
                  var resultOfNavigation = await context.push('/createTimer');
                  if (resultOfNavigation == "refresh") {
                    bloc.add(TimesheetsRefresh());
                  }
                })
              ],
              title: Text(
                "Timesheets",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            body: const _TimesheetsContentWidget()));
  }
}

class _TimesheetsContentWidget extends StatelessWidget {
  const _TimesheetsContentWidget();

  @override
  Widget build(BuildContext context) {
    context.read<TimesheetsBloc>().add(TimesheetsRefresh());
    return BlocBuilder<TimesheetsBloc, TimesheetsState>(
        builder: (context, state) {
      return switch (state) {
        TimesheetsInitial() => const Center(),
        TimesheetsLoading() => const LoadingIndicator(),
        TimesheetsError() => ErrorCenterWidget(state.errorMessage),
        TimesheetsEmptyLoaded() => EmptyContentWidget.emptyTimesheets(() {}),
        TimesheetsLoaded() => TimesheetsWidget(timesheets: state.timesheets)
      };
    });
  }
}
