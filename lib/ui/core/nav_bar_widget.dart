part of 'root_widget.dart';

Widget _timesheetMenuUnselected =
    SvgPicture.asset('assets/clock_unselected.svg');
Widget _timesheetMenuSelected = SvgPicture.asset('assets/clock_selected.svg');
Widget _projectsMenuUnselected =
    SvgPicture.asset('assets/project_unselected.svg');
Widget _projectsMenuSelected = SvgPicture.asset('assets/project_selected.svg');
Widget _projectsSettingsUnselected =
    SvgPicture.asset('assets/settings_unselected.svg');
Widget _projectsSettingsSelected =
    SvgPicture.asset('assets/settings_selected.svg');

List<Widget> _destinations = [
  NavigationDestination(
    icon: _timesheetMenuUnselected,
    selectedIcon: _timesheetMenuSelected,
    label: "Timesheets",
  ),
  NavigationDestination(
    icon: _projectsMenuUnselected,
    selectedIcon: _projectsMenuSelected,
    label: "Projects",
  ),
  NavigationDestination(
    icon: _projectsSettingsUnselected,
    selectedIcon: _projectsSettingsSelected,
    label: "Settings",
  ),
];
