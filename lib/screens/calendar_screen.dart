import 'package:flutter/material.dart';
import 'package:google_classroom_project/controllers/navigation_controller.dart';
import 'package:google_classroom_project/widgets/drawer_widget.dart';
import 'package:provider/provider.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (didPop, result) {
        context.read<NavigationController>().currNavIndex = 1;
      },
      child: Scaffold(
        appBar: AppBar(),
        drawer: DrawerWidget(),
        body: Center(
          child: CalendarDatePicker(
            initialDate: DateTime.now(),
            firstDate: DateTime.now().subtract(const Duration(days: 10000)),
            lastDate: DateTime.now().add(const Duration(days: 10000)),
            onDateChanged: (v) {},
          ),
        ),
      ),
    );
  }
}
