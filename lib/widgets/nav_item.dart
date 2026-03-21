import 'package:flutter/material.dart';
import 'package:google_classroom_project/controllers/dark_mode_controller.dart';
import 'package:provider/provider.dart';

class NavItem extends StatelessWidget {
  String title;
  IconData icon;
  VoidCallback onTap;
  int i;
  int currNavIndex;
  NavItem({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    required this.i,
    required this.currNavIndex,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: currNavIndex == i
          ? const Color.fromARGB(255, 214, 235, 253)
          : Colors.white,
      minTileHeight: 50,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 2,
      ),
      leading: Icon(
        icon,
        color: Provider.of<DarkModeController>(context, listen: true).isDark
            ? Colors.white
            : Colors.black,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: Provider.of<DarkModeController>(context, listen: true).isDark
              ? Colors.white
              : Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: onTap,
    );
  }
}
