# flutter_test_sample

Test task: Flutter timer application with specific UI requirements

https://github.com/PelipetsOlga/TimersSampleFlutterApp/assets/13727561/c04b58f4-a666-4b34-b2e1-3fbade6253aa


## Getting Started

Why Does Code Quality Matter So Much?
We focus on several key principles that we believe are indicative of high-quality code:

1.  DRY (Don't Repeat Yourself): We value code that is efficient and avoids unnecessary repetition.
2. Clean Architecture: Our ideal code is structured, maintainable, and scalable.
3. Adherence to Framework Best Practices: We look for code that effectively utilizes the strengths of its framework.
4. Utilization of Open Source Libraries: We appreciate when developers leverage existing resources instead of reinventing the wheel.
5. Incorporation of LLM and AI: We're keen on code that smartly integrates advanced technologies.
6. Automatic Code Generation: We value the innovative use of tools to streamline development.
7. Principles of Object-Oriented Programming (OOP): We believe in the power of OOP in creating robust and efficient code.

Description

We should demonstrate skills in building widgets, applying theme styles (TextStyle, Color, etc.), 
and using the BLoC pattern for state management. 
The task involves creating three main layouts based on provided Figma designs.


Task Requirements

1. List of Timers Screen:
- Display a list of timers.
- Each list item should show relevant details provided in the design.
- Pressing the play/pause button should run or pause the timer
- Skip implementing different tabs (favorite, odoo etc)
- Skip implementing the bottom navigation bar (recents, projects etc)
- Plus button in the AppBar should take user to create timer screen

2. Create Timer Screen:
- Implement a form to create a new timer.
- Include dropdowns for selecting projects and tasks.
- Add a text input for the timer description.
- Include a checkbox for marking the timer as a favorite.
- Upon adding a timer user should return to the list of timers screen.

3. Task Details Screen:
- Display details of a selected task in the details tab(you can use random or static deadline and assigned to values)
- Show the running timer-related details and description in the timesheets tab. 
- Pressing play/pause should run or pause the timer. Pressing stop will mark it as completed.
- Updating the timer state should reflect on the list of timer screen and vice-versa.
- Show normal completed timers (Optional)
- Show expandable completed timers (Optional)

4. In-Memory Data Management:
- Use a pre-defined in-memory list for projects and tasks data. 
- Each Timer can contain information about Task, and Project as well. 
- Feel free to structure the data as you wish from the design.
- All data (timers, projects, tasks) should be managed in-memory. 
- Use hydrated_bloc package if needed to persist some data. No need for persistence otherwise.

5. Theme and Styling:
Implement theme styles (TextStyle, Color, etc.) according to the provided design system in Figma.
Ensure the UI matches the Figma designs.

6. State Management:
Use the BLoC pattern for state management across the application.

7. Figma Designs:
https://www.figma.com/file/c49rQlERvtonmAm7Nbj7AT/odoo-apexive?type=design&node-id=0-1&mode=design&t=dzCAZ5WvTJNORID0-0
