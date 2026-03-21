import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:google_classroom_project/controllers/dark_mode_controller.dart';

// ignore: must_be_immutable
class ClassworkWidget extends StatelessWidget {
  String title;
  String time;
  Color color;
  ClassworkWidget({
    Key? key,
    required this.title,
    required this.time,
    required this.color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDark = Provider.of<DarkModeController>(context, listen: true).isDark;

    // double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    final foregroundColor = isDark ? Colors.white : Colors.black;
    final backgroundColor =
        isDark ? Colors.black : const Color.fromARGB(255, 246, 246, 246);

    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color,
        radius: width * 0.065,
        child: Icon(
          Icons.book_sharp,
          color: backgroundColor,
          size: 30,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          color: foregroundColor,
          fontWeight: FontWeight.w400,
        ),
      ),
      subtitle: Text(
        "Posted $time",
        style: TextStyle(
          color: foregroundColor,
          fontWeight: FontWeight.w300,
        ),
      ),
      onTap: () {},
    );
  }
}
