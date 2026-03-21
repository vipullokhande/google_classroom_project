import 'package:flutter/material.dart';

class ProfileTextIconTile extends StatelessWidget {
  Color foregroundColor;
  double width;
  IconData icon;
  String text;
  ProfileTextIconTile({
    super.key,
    required this.foregroundColor,
    required this.width,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.only(
        left: width * 0.07,
      ),
      leading: Icon(
        // Icons.person_search_outlined,
        icon,
        color: foregroundColor,
      ),
      title: Text(
        // 'Manage accounts on this device',
        text,
        style: TextStyle(
          color: foregroundColor,
        ),
      ),
      onTap: () {},
    );
  }
}
