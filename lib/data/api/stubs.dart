part of 'timers_api.dart';

final List<Project> _projectsStub = [
  project1,
  project2,
  project3,
  project4,
  project5,
  project6,
  project7,
  project4,
  project3,
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
  title: "HL.cafe Stability",
  description: "This is a long description of the task with deadlines and "
      "assigned developer and technologies used",
  number: "SO072",
  favourite: false,
  userId: "123456",
  tasks: _tasksStub.take(6).toList(),
  startDate: DateTime.parse('2024-01-20 00:00:00.000').millisecondsSinceEpoch,
  deadline: DateTime.parse('2024-04-01 00:00:00.000').millisecondsSinceEpoch,
);

Project project2 = Project(
  id: generateId(),
  title: "HL.cafe Performance",
  description: "This is a long description of the task with deadlines and "
      "assigned developer and technologies used",
  number: "SO070",
  favourite: false,
  userId: "123456",
  tasks: _tasksStub.take(5).toList(),
  startDate: DateTime.parse('2024-02-20 00:00:00.000').millisecondsSinceEpoch,
  deadline: DateTime.parse('2024-04-01 00:00:00.000').millisecondsSinceEpoch,
);

Project project3 = Project(
  id: generateId(),
  title: "HL.pizza Performance",
  description: "This is a long description of the task with deadlines and "
      "assigned developer and technologies used",
  number: "SO074",
  favourite: false,
  userId: "123456",
  tasks: _tasksStub.take(4).toList(),
  startDate: DateTime.parse('2024-01-02 00:00:00.000').millisecondsSinceEpoch,
  deadline: DateTime.parse('2024-04-01 00:00:00.000').millisecondsSinceEpoch,
);

Project project4 = Project(
  id: generateId(),
  title: "HL.pizza Performance",
  description: "This is a long description of the task with deadlines and "
      "assigned developer and technologies used",
  number: "SO078",
  favourite: false,
  userId: "123456",
  tasks: _tasksStub.take(6).toList(),
  startDate: DateTime.parse('2024-01-01 00:00:00.000').millisecondsSinceEpoch,
  deadline: DateTime.parse('2024-04-01 00:00:00.000').millisecondsSinceEpoch,
);

Project project5 = Project(
  id: generateId(),
  title: "HL.pizza Performance",
  description: "This is a long description of the task with deadlines and "
      "assigned developer and technologies used",
  number: "SO033",
  favourite: false,
  userId: "123456",
  tasks: _tasksStub.take(1).toList(),
  startDate: DateTime.parse('2024-03-01 00:00:00.000').millisecondsSinceEpoch,
  deadline: DateTime.parse('2024-04-01 00:00:00.000').millisecondsSinceEpoch,
);

Project project6 = Project(
  id: generateId(),
  title: "HL.pizza Stability",
  description: "This is a long description of the task with deadlines and "
      "assigned developer and technologies used",
  number: "SO092",
  favourite: false,
  userId: "123456",
  tasks: _tasksStub.take(6).toList(),
  startDate: DateTime.parse('2024-01-20 00:00:00.000').millisecondsSinceEpoch,
  deadline: DateTime.parse('2024-04-01 00:00:00.000').millisecondsSinceEpoch,
);

Project project7 = Project(
  id: generateId(),
  title: "HL.pizza Performance",
  description: "This is a long description of the task with deadlines and "
      "assigned developer and technologies used",
  number: "SO094",
  favourite: false,
  userId: "123456",
  tasks: _tasksStub.take(4).toList(),
  startDate: DateTime.parse('2024-01-20 00:00:00.000').millisecondsSinceEpoch,
  deadline: DateTime.parse('2024-05-01 00:00:00.000').millisecondsSinceEpoch,
);

TimeSheet timeSheet1 = TimeSheet(
  id: "12",
  userId: "1234",
  project: project1,
  favourite: false,
  description:
      "As a user, I would like to be able to buy a subscription, this would allow me to get a discount on the products and on the second stage of diagnosis",
  inProgress: false,
  task: taskStub1,
  completed: false,
  durationExpected: 30 * 60 * 60 * 1000,
  durationActual: 5 * 60 * 60 * 1000,
  state: TimerState.inPause,
  lastTickerStartTime: 0,
);

TimeSheet timeSheet2 = TimeSheet(
  id: "1253",
  userId: "1234",
  project: project2,
  favourite: false,
  description:
      "Sync with Client, communicate, work on the new design with designer, new tasks preparation call with the front end",
  inProgress: false,
  task: taskStub2,
  completed: false,
  durationExpected: 40 * 60 * 60 * 1000,
  durationActual: 25 * 60 * 60 * 1000,
  state: TimerState.inPause,
  lastTickerStartTime: 0,
);

TimeSheet timeSheet3 = TimeSheet(
  id: "1223",
  userId: "1234",
  project: project3,
  favourite: false,
  description:
      "As a user, I would like to be able to buy a subscription, this would allow me to get a discount on the products and on the second stage of diagnosis",
  inProgress: false,
  task: taskStub3,
  completed: true,
  durationExpected: 30 * 60 * 60 * 1000,
  durationActual: 30 * 60 * 60 * 1000,
  state: TimerState.completed,
  lastTickerStartTime: 0,
);

TimeSheet timeSheet4 = TimeSheet(
  id: "1523",
  userId: "1234",
  project: project3,
  favourite: false,
  description:
      "Sync with Client, communicate, work on the new design with designer, new tasks preparation call with the front end",
  inProgress: false,
  task: taskStub4,
  completed: false,
  durationExpected: 30 * 60 * 60 * 1000,
  durationActual: 0,
  state: TimerState.initial,
  lastTickerStartTime: 0
);
