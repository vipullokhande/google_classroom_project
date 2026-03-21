import 'package:flutter/material.dart';
import 'package:google_classroom_project/screens/home_screen.dart';

class PopupMenuButtonWidget extends StatelessWidget {
  Color backgroundColor;
  Color foregroundColor;
  PopupMenuButtonWidget({
    super.key,
    required this.backgroundColor,
    required this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      splashRadius: 10,
      color: backgroundColor,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
        side: BorderSide(
          color: foregroundColor,
          width: 1,
        ),
      ),
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            value: AccountItem.remove,
            child: Text(
              'Remove',
              style: TextStyle(
                color: foregroundColor,
              ),
            ),
          ),
        ];
      },
      child: Icon(
        Icons.more_vert_rounded,
        color: foregroundColor,
      ),
    );
  }
}
