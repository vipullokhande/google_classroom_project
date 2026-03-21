import 'package:flutter/material.dart';
import 'package:google_classroom_project/controllers/dark_mode_controller.dart';
import 'package:provider/provider.dart';

class ScaffoldWidget extends StatelessWidget {
  final Widget body;
  dynamic skey;
  Color? backgroundColor;
  AppBar? appBar;
  Widget? floatingActionButton;
  Widget? drawer;
  Widget? bottomNavigationBar;
  ScaffoldWidget({
    super.key,
    required this.body,
    this.skey,
    this.backgroundColor,
    this.appBar,
    this.floatingActionButton,
    this.drawer,
    this.bottomNavigationBar,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<DarkModeController>(
      builder: (context, value, child) {
        return Scaffold(
          key: skey,
          backgroundColor: backgroundColor != null
              ? value.isDark
                    ? Colors.black54
                    : Colors.white60
              : backgroundColor,
          appBar: appBar,
          floatingActionButton: floatingActionButton,
          drawer: drawer,
          body: body,
          bottomNavigationBar: bottomNavigationBar,
        );
      },
    );
  }
}
