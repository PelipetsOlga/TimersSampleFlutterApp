part of 'app.dart';

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => ThemeWrapperWidget(const RootWidget()),
    ),
    GoRoute(
      path: '/createTimer',
      builder: (context, state) => ThemeWrapperWidget(const CreateTimer()),
    ),
  ],
);
