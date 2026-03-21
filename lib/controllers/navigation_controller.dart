import 'package:flutter/material.dart';
import 'package:google_classroom_project/screens/calendar_screen.dart';
import 'package:google_classroom_project/screens/home_screen.dart';

class NavigationController extends ChangeNotifier {
  int currNavIndex = 1;
  changeNavIndex(
    int newIndex,
    BuildContext context,
    GlobalKey<ScaffoldState> globalKey,
  ) {
    if (currNavIndex == newIndex) return;
    currNavIndex = newIndex;
    globalKey.currentState!.closeDrawer();
    switch (currNavIndex) {
      case 1:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => const HomeScreen(),
          ),
        );
        break;
      case 2:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => const CalendarScreen(),
          ),
        );
        break;
      default:
        break;
    }
    notifyListeners();
  }
}
