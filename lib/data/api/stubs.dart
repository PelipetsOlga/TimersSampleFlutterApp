part of 'timers_api.dart';

final List<Project> _projectsStub = [
  project1,
  project2,
  project3,
  project4,
  project5,
  project6,
  project7,
];

Task taskStub1 = Task(
  id: generateId(),
  title: "iOS App deployment",
  deadline: "2024-05-20",
);

Task taskStub2 = Task(
  id: generateId(),
  title: "iOS App integration",
  deadline: "2024-05-25",
);
Task taskStub3 = Task(
  id: generateId(),
  title: "Android App deployment",
  deadline: "2024-06-01",
);

Task taskStub4 = Task(
  id: generateId(),
  title: "Android App integration",
  deadline: "2024-06-25",
);
Task taskStub5 = Task(
  id: generateId(),
  title: "Web App deployment",
  deadline: "2024-07-25",
);

Task taskStub6 = Task(
  id: generateId(),
  title: "Web App integration",
  deadline: "2024-08-25",
);

List<Task> _tasksStub = [
  taskStub1,
  taskStub2,
  taskStub3,
  taskStub4,
  taskStub5,
  taskStub6
];

Project project1 = Project(
  id: generateId(),
  title: "SO072: HL.cafe Stability",
  description: "This is a long description of the task with deadlines and "
      "assigned developer and technologies used",
  favourite: false,
  userId: "123456",
  tasks: _tasksStub.take(6).toList(),
);

Project project2 = Project(
  id: generateId(),
  title: "SO070: HL.cafe Performance",
  description: "This is a long description of the task with deadlines and "
      "assigned developer and technologies used",
  favourite: false,
  userId: "123456",
  tasks: _tasksStub.take(5).toList(),
);

Project project3 = Project(
  id: generateId(),
  title: "SO074: HL.pizza Performance",
  description: "This is a long description of the task with deadlines and "
      "assigned developer and technologies used",
  favourite: false,
  userId: "123456",
  tasks: _tasksStub.take(4).toList(),
);

Project project4 = Project(
  id: generateId(),
  title: "SO078: HL.pizza Performance",
  description: "This is a long description of the task with deadlines and "
      "assigned developer and technologies used",
  favourite: false,
  userId: "123456",
  tasks: _tasksStub.take(6).toList(),
);

Project project5 = Project(
  id: generateId(),
  title: "SO033: HL.pizza Performance",
  description: "This is a long description of the task with deadlines and "
      "assigned developer and technologies used",
  favourite: false,
  userId: "123456",
  tasks: _tasksStub.take(1).toList(),
);

Project project6 = Project(
  id: generateId(),
  title: "SO092: HL.pizza Stability",
  description: "This is a long description of the task with deadlines and "
      "assigned developer and technologies used",
  favourite: false,
  userId: "123456",
  tasks: _tasksStub.take(6).toList(),
);

Project project7 = Project(
  id: generateId(),
  title: "SO094: HL.pizza Performance",
  description: "This is a long description of the task with deadlines and "
      "assigned developer and technologies used",
  favourite: false,
  userId: "123456",
  tasks: _tasksStub.take(4).toList(),
);
