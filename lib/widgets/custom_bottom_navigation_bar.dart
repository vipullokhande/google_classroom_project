import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  int index;
  Color selectedColor;
  Color backColor;
  Function(int)? onTap;
  CustomBottomNavigationBar({
    super.key,
    required this.index,
    required this.selectedColor,
    required this.backColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(splashColor: Colors.transparent),
      child: BottomNavigationBar(
        onTap: onTap,
        currentIndex: index,
        backgroundColor: backColor,
        selectedItemColor: selectedColor,
        unselectedItemColor: const Color.fromARGB(255, 144, 144, 144),
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            label: 'Stream',
            icon: Icon(Icons.messenger_outline_outlined),
          ),
          BottomNavigationBarItem(
            label: 'Classwork',
            icon: Icon(Icons.filter_frames_rounded),
          ),
          BottomNavigationBarItem(
            label: 'People',
            icon: Icon(Icons.people_outline_outlined),
          ),
        ],
      ),
    );
  }
}
