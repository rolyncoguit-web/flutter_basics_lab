1. What is the difference between a StatelessWidget and a StatefulWidget? Give one example of each.

A StatelessWidget displays content that does not change by itself, like ProfileCard in Activity 1. A StatefulWidget can update its UI when data changes, like WaterTrackerPage in Activity 2.

2. Why is a StatefulWidget written as two classes? What does each class do?

The StatefulWidget creates the State object, while the State class stores changing data and builds the UI.

3. What happened when you changed \_glasses outside setState()? Why?

The screen did not update automatically because Flutter was not notified to rebuild the UI.

4. When is build() called?

It is called when the screen first loads and when Flutter needs to rebuild the UI, such as after setState().

5. Explain the main axis and cross axis of a Row and Column.

In a Row, the main axis is horizontal and the cross axis is vertical. In a Column, the main axis is vertical and the cross axis is horizontal.

6. What happened when you removed Expanded from a StatBox? What does it do?

The boxes no longer shared the available width equally. Expanded distributes the available space among its children.

7. Why use GridView.builder instead of a Column for the menu?

GridView.builder displays items in a scrollable grid and builds items as needed, making it suitable for menus.

8. How do Stack and Positioned create the Best seller badge?

Stack layers widgets on top of each other, while Positioned places the badge at the top-left corner of the card.

9. What is the difference between ThemeData and a style on one widget?

ThemeData customizes the whole app, such as button shapes. A widget-specific style changes only one widget, such as a Text widget's font size.

10. Which widget holds the dark-mode state, and how does the change reach MaterialApp?

\_ThemeDemoAppState stores \_isDark. The switch calls a callback, setState() updates the value, and MaterialApp changes the theme through themeMode.
