import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../timesheets/timesheets_bloc/bloc.dart';

class GoBackWidget extends StatelessWidget{
  const GoBackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    context.pop("refresh");
    return const Center();
  }
}

