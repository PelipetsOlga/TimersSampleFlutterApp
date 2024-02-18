import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_sample/domain/models/task.dart';
import 'package:flutter_test_sample/ui/widgets/primary_button.dart';

import '../../domain/models/project.dart';
import '../widgets/form_items.dart';
import 'bloc/bloc.dart';

class CreateTimerContentWidget extends StatefulWidget {
  List<ProjectModel> projects;

  CreateTimerContentWidget(this.projects, {super.key});

  @override
  State<StatefulWidget> createState() {
    return _CreateTimerContentWidgetState();
  }
}

class _CreateTimerContentWidgetState extends State<CreateTimerContentWidget> {
  final _formKey = GlobalKey<FormState>();
  final projectController = TextEditingController();
  final taskController = TextEditingController();
  final descriptionController = TextEditingController();
  ProjectModel? selectedProject;
  TaskModel? selectedTask;
  bool isFavourite = false;

  @override
  void dispose() {
    projectController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final projectsItems = <PopupMenuItem>[];
    var projectTitles =
        widget.projects.map((e) => "${e.number}: ${e.title}").toList();
    for (var i = 0; i < widget.projects.length; i++) {
      projectsItems.add(PopupMenuItem(
        value: i,
        child: Text(projectTitles[i]),
      ));
    }

    final tasksItems = <PopupMenuItem>[];
    final tasksTitles = <String>[];

    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              PopupMenuButton(
                itemBuilder: (BuildContext context) {
                  return projectsItems;
                },
                onSelected: (value) {
                  projectController.text = projectTitles[value];
                  selectedProject = widget.projects[value];
                  selectedTask = null;
                  tasksItems.clear();
                  tasksTitles.clear();
                  taskController.text = '';
                  var project = widget.projects[value];
                  tasksTitles
                      .addAll(project.tasks.map((e) => e.title).toList());
                  for (var i = 0; i < project.tasks.length; i++) {
                    tasksItems.add(PopupMenuItem(
                      value: i,
                      child: Text(tasksTitles[i]),
                    ));
                  }
                },
                child: TextFormField(
                  enabled: false,
                  controller: projectController,
                  style: Theme.of(context).textTheme.bodyLarge,
                  maxLines: 1,
                  decoration:
                      getSpinnerInputDecoration("Project", context, true),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a project';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 24),
              PopupMenuButton(
                  itemBuilder: (BuildContext context) {
                    return tasksItems;
                  },
                  onSelected: (value) {
                    taskController.text = tasksTitles[value];
                    selectedTask = selectedProject?.tasks[value];
                  },
                  child: TextFormField(
                      enabled: false,
                      controller: taskController,
                      style: Theme.of(context).textTheme.bodyLarge,
                      maxLines: 1,
                      decoration:
                          getSpinnerInputDecoration("Task", context, true),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select a task';
                        }
                        return null;
                      })),
              const SizedBox(height: 24),
              TextFormField(
                  controller: descriptionController,
                  style: Theme.of(context).textTheme.bodyLarge,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration:
                      getSpinnerInputDecoration("Description", context, false),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  }),
              const SizedBox(height: 24),
              Row(
                children: [
                  Checkbox(
                    checkColor: Colors.white,
                    activeColor: Colors.white.withOpacity(0.16),
                    value: isFavourite,
                    onChanged: (bool? value) {
                      setState(() {
                        isFavourite = value!;
                      });
                    },
                  ),
                  const Text("Make Favorite"),
                ],
              ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: PrimaryButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate() &&
                        selectedProject != null &&
                        selectedTask != null) {
                      context.read<TimerCreateBloc>().add(TimerCreateDo(
                          description: descriptionController.text,
                          like: isFavourite,
                          project: selectedProject!,
                          task: selectedTask!));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Please fill all fields')),
                      );
                    }
                  },
                  text: 'Submit',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
