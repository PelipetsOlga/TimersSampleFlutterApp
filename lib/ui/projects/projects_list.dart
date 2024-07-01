import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_sample/ui/core/app_widget.dart';
import 'package:flutter_test_sample/ui/widgets/card.dart';

import '../../domain/models/project.dart';
import '../widgets/accent_border.dart';
import '../widgets/star_checkbox.dart';
import 'projects_bloc/bloc.dart';

class ProjectsListWidget extends StatefulWidget {
  final List<ProjectModel> projects;
  final bool favorite;

  const ProjectsListWidget(this.projects, this.favorite, {super.key});

  @override
  State<ProjectsListWidget> createState() => _ProjectsListWidgetState();
}

class _ProjectsListWidgetState extends State<ProjectsListWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
            (_) => print("project_list rect=${context.globalPaintBounds}"));
  }

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
      child: ListView.builder(
        itemCount: widget.projects.length,
        itemBuilder: (BuildContext context, int index) {
          return ProjectWidget(widget.projects[index], widget.favorite);
        },
      ),
    );
  }
}

class ProjectWidget extends StatefulWidget {
  final ProjectModel project;
  final bool favorite;

  const ProjectWidget(this.project, this.favorite, {super.key});

  @override
  State<ProjectWidget> createState() => _ProjectWidgetState();
}

class _ProjectWidgetState extends State<ProjectWidget> {
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
        (_) => print("project_widget rect=${context.globalPaintBounds}"));
  }

  @override
  Widget build(BuildContext context) {
    return AppCard(
        child: Row(
      children: [
        const AccentVerticalBorder(height: 56),
        const SizedBox(width: 16),
        Flexible(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  StarCheckbox(
                    isChecked: widget.project.favourite,
                    onChange: (value) {
                      if (widget.favorite) {
                        context.read<ProjectsBlocFavouritesMixin>().add(
                            ProjectLike(project: widget.project, like: value));
                      } else {
                        context.read<ProjectsBlocNormalMixin>().add(
                            ProjectLike(project: widget.project, like: value));
                      }
                    },
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "${widget.project.number}: ${widget.project.title}",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ]),
                const SizedBox(height: 4),
                Text(
                  widget.project.tasks.length == 1
                      ? "1 Task"
                      : "${widget.project.tasks.length} Tasks",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ]),
        ),
      ],
    ));
  }
}
