import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/dark_mode_controller.dart';

// ignore: must_be_immutable
class NewMaterialWidget extends StatelessWidget {
  String title;
  String time;
  Color? color;
  NewMaterialWidget({
    super.key,
    required this.title,
    required this.time,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Provider.of<DarkModeController>(context, listen: true).isDark;

    var addCommentController = TextEditingController();

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    final foregroundColor = isDark ? Colors.white : Colors.black;
    final hintforegroundColor =
        isDark ? const Color.fromARGB(255, 188, 188, 188) : Colors.black;
    final backgroundColor =
        isDark ? Colors.black : const Color.fromARGB(255, 246, 246, 246);
    final backColor =
        isDark ? const Color.fromARGB(255, 43, 43, 43) : Colors.white;

    return Container(
      margin: EdgeInsets.symmetric(vertical: height * 0.005),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: backColor,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: [
          ListTile(
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
              'New material : $title',
              style: TextStyle(
                color: foregroundColor,
                fontWeight: FontWeight.w400,
              ),
            ),
            subtitle: Text(
              time,
              style: TextStyle(
                color: foregroundColor,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          Divider(
            color: foregroundColor,
            height: 1.5,
          ),
          TextField(
            controller: addCommentController,
            clipBehavior: Clip.antiAlias,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              hintText: "Add class comment",
              hintStyle: TextStyle(
                color: hintforegroundColor,
              ),
              fillColor: backColor,
              filled: true,
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
            ),
          )
        ],
      ),
    );
  }
}
