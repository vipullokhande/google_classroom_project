import 'package:flutter/material.dart';
import 'package:google_classroom_project/screens/calendar_screen.dart';
import 'package:google_classroom_project/screens/home_screen.dart';

class NavigationController extends ChangeNotifier {
  int currNavIndex = 1;
  changeNavIndex(int newIndex, BuildContext context) {
    if (currNavIndex == newIndex) return;
    currNavIndex = newIndex;
    notifyListeners();
    switch (currNavIndex) {
      case 1:
        navigateAndReplace(context, HomeScreen());
        break;
      case 2:
        navigateAndReplace(context, CalendarScreen());
        break;
      case 3:
        navigateAndReplace(context, Scaffold());
        break;
      default:
        break;
    }
  }

  navigateAndReplace(BuildContext context, Widget screen) {
    Navigator.of(
      context,
      rootNavigator: true,
    ).push(MaterialPageRoute(builder: (_) => screen));
  }
}
