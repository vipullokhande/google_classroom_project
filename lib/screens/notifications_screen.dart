import 'package:flutter/material.dart';
import 'package:google_classroom_project/widgets/drawer_widget.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(drawer: DrawerWidget(), appBar: AppBar());
  }
}
