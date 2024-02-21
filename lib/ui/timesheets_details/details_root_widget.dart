import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_sample/domain/repositories/auth_repo.dart';
import 'package:flutter_test_sample/ui/timesheets_details/selection_bloc/bloc.dart';
import 'package:flutter_test_sample/ui/timesheets_details/timesheet_selected_detail.dart';
import 'package:get_it/get_it.dart';

import '../../domain/repositories/timers_repo.dart';
import '../widgets/error_widget.dart';
import '../widgets/loading.dart';
import 'timesheets_details_bloc/bloc.dart';
import 'timesheets_list.dart';

class TimesheetsDetailsRootWidget extends StatelessWidget {
  const TimesheetsDetailsRootWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var profile = GetIt.instance.get<AuthRepository>().profile();
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back_ios)),
          title: Text(
            "Get to know Apexer - ${profile.firstName}",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                  icon: Text("Timesheets",
                      style: Theme.of(context).textTheme.labelLarge)),
              Tab(
                  icon: Text("Details",
                      style: Theme.of(context).textTheme.labelLarge)),
            ],
          ),
        ),
        body: MultiBlocProvider(
          providers: [
            BlocProvider<TimesheetsDetailsBloc>(
              create: (BuildContext context) => TimesheetsDetailsBloc(
                GetIt.instance.get<TimersRepository>(),
              ),
            ),
            BlocProvider<TimesheetSelectedBloc>(
              create: (BuildContext context) => TimesheetSelectedBloc(),
            ),
          ],
          child: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            children: [_TimesheetsListWidget(), _TimesheetsDetailsWidget()],
          ),
        ),
      ),
    );
  }
}

class _TimesheetsListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.read<TimesheetsDetailsBloc>().add(TimesheetsRefresh());
    return BlocBuilder<TimesheetsDetailsBloc, TimesheetsDetailsState>(
        builder: (context, state) {
      return switch (state) {
        TimesheetsInitial() => const Center(),
        TimesheetsLoading() => const LoadingIndicator(),
        TimesheetsError() => ErrorCenterWidget(state.errorMessage),
        TimesheetsEmptyLoaded() => const Center(),
        TimesheetsLoaded() => TimesheetsListWidget(
            timesheetsActive: state.timesheetsActive,
            timesheetsCompleted: state.timesheetsCompleted,
          ),
      };
    });
  }
}

class _TimesheetsDetailsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimesheetSelectedBloc, TimesheetDetailsState>(
        builder: (context, state) {
      return switch (state) {
        TimesheetEmpty() => const Center(),
        TimesheetLoaded() => TimesheetSelectedDetailsWidget(state.timesheet),
      };
    });
  }
}
