part of 'app.dart';

const String destinationCreateTimer = '/createTimer';
const String destinationTimesheetsDetails = '/details';

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => ThemeWrapperWidget(const RootWidget()),
    ),
    GoRoute(
      path: destinationCreateTimer,
      pageBuilder: (_, state) {
        return CustomSlideTransition(
          key: state.pageKey,
          child: ThemeWrapperWidget(const CreateTimer()),
        );
      },
    ),
    GoRoute(
      path: destinationTimesheetsDetails,
      pageBuilder: (_, state) {
        return CustomSlideTransition(
          key: state.pageKey,
          child: ThemeWrapperWidget(const TimesheetsDetailsRootWidget()),
        );
      },
    ),
  ],
);

class CustomSlideTransition extends CustomTransitionPage<void> {
  CustomSlideTransition({super.key, required super.child})
      : super(
          transitionDuration: const Duration(milliseconds: 250),
          transitionsBuilder: (_, animation, __, child) {
            return SlideTransition(
              position: animation.drive(
                Tween(
                  begin: const Offset(1.5, 0),
                  end: Offset.zero,
                ).chain(
                  CurveTween(curve: Curves.ease),
                ),
              ),
              child: child,
            );
          },
        );
}
