import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../domain/models/project.dart';

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
        color: Colors.white.withOpacity(0.16),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            child: Row(
              children: [
                Container(
                  width: 2,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.outline,
                    borderRadius: const BorderRadius.all(Radius.circular(1.0)),
                  ),
                ),
                const SizedBox(width: 16),
                Flexible(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset("assets/star_empty.svg"),
                            const SizedBox(width: 8),
                            Text(
                              project.title,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "${project.tasks.length} Tasks",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ]),
                ),
              ],
            ),
          ),
        ));
  }
}
