import 'package:flutter/material.dart';

class DialogProfileTile extends StatelessWidget {
  Color foregroundColor;
  String imgName;
  String username;
  String useremail;
  DialogProfileTile({
    super.key,
    required this.foregroundColor,
    required this.imgName,
    required this.username,
    required this.useremail,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 0,
      ),
      leading: ClipOval(
        child: Image.asset(
          'assets/$imgName.png',
          height: 45,
          width: 45,
          fit: BoxFit.cover,
        ),
      ),
      title: Text(
        username,
        style: TextStyle(
          color: foregroundColor,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        useremail,
        style: TextStyle(
          color: foregroundColor,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
