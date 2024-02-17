import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/models/project.dart';
import '../widgets/accent_border.dart';
import '../widgets/star_checkbox.dart';
import 'projects_bloc/bloc.dart';

class ProjectsListWidget extends StatelessWidget {
  final List<ProjectModel> projects;

  const ProjectsListWidget(this.projects, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
      child: ListView.builder(
        itemCount: projects.length,
        itemBuilder: (BuildContext context, int index) {
          return ProjectWidget(projects[index]);
        },
      ),
    );
  }
}

class ProjectWidget extends StatelessWidget {
  final ProjectModel project;

  const ProjectWidget(this.project, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.white.withOpacity(0.08),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
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
                          isChecked: project.favourite,
                          onChange: (value) {
                            context.read<ProjectsBloc>().add(ProjectLike(
                                projectId: project.id, like: value));
                          },
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            "${project.number}: ${project.title}",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                      ]),
                      const SizedBox(height: 4),
                      Text(
                        project.tasks.length == 1
                            ? "1 Task"
                            : "${project.tasks.length} Tasks",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ]),
              ),
            ],
          ),
        ));
  }
}
