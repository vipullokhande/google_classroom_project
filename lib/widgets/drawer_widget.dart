import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_classroom_project/controllers/dark_mode_controller.dart';
import 'package:google_classroom_project/controllers/navigation_controller.dart';
import 'package:google_classroom_project/screens/inner_screen.dart';
import 'package:google_classroom_project/widgets/nav_recycle_item.dart';
import 'package:provider/provider.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  List<String> backgrounds = [
    'https://static.vecteezy.com/system/resources/thumbnails/007/136/275/small/machine-learning-modern-computer-technologies-concept-artificial-intelligence-ai-photo.jpg',
    'https://media.istockphoto.com/id/1314385575/photo/kindergarten-classroom-and-frame-for-mockup-3d-rendering.jpg?s=612x612&w=is&k=20&c=d0nS6WSqoi7aYc4NExyotr759aDSwb8w3LQDsz8JwBs=',
    'https://media.istockphoto.com/id/1205276835/vector/empty-classroom-interior-school-or-college-class.jpg?s=612x612&w=0&k=20&c=K9fFk7oxhT4ztcaPI0hrhDxajR_6dzyMwUsSi0jP1Lg=',
    'https://static.vecteezy.com/system/resources/thumbnails/007/136/275/small/machine-learning-modern-computer-technologies-concept-artificial-intelligence-ai-photo.jpg',
    'https://www.shutterstock.com/shutterstock/photos/1666773679/display_1500/stock-photo-classroom-in-university-for-education-d-rendering-1666773679.jpg',
    'https://media.istockphoto.com/id/1205276835/vector/empty-classroom-interior-school-or-college-class.jpg?s=612x612&w=0&k=20&c=K9fFk7oxhT4ztcaPI0hrhDxajR_6dzyMwUsSi0jP1Lg=',
    'https://otus.com/wp-content/uploads/2020/09/2-1024x576.png',
    'https://www.shutterstock.com/shutterstock/photos/1666773679/display_1500/stock-photo-classroom-in-university-for-education-d-rendering-1666773679.jpg',
    'https://media.istockphoto.com/id/1205276835/vector/empty-classroom-interior-school-or-college-class.jpg?s=612x612&w=0&k=20&c=K9fFk7oxhT4ztcaPI0hrhDxajR_6dzyMwUsSi0jP1Lg=',
    'https://otus.com/wp-content/uploads/2020/09/2-1024x576.png',
    'https://www.shutterstock.com/shutterstock/photos/1666773679/display_1500/stock-photo-classroom-in-university-for-education-d-rendering-1666773679.jpg',
    'https://media.istockphoto.com/id/1205276835/vector/empty-classroom-interior-school-or-college-class.jpg?s=612x612&w=0&k=20&c=K9fFk7oxhT4ztcaPI0hrhDxajR_6dzyMwUsSi0jP1Lg=',
  ];
  final List<Color> colors = [
    Colors.pink,
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.brown,
    Colors.purple,
    Colors.pink,
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.brown,
    Colors.purple,
  ];
  List<String> classRoomNames = [
    'Machine Learning',
    'Distributed Computing',
    'Software Engineering',
    'Social Media Analytics',
    'Environmental Management',
    'Digital Forensics',
  ];
  List<String> navTitles = [
    'Classes',
    'Calender',
    'Notifications',
    'Offline files',
    'Archived classes',
    'Classroom folders',
    'Settings',
    'Help',
  ];
  List<IconData> navIcons = [
    Icons.home_outlined,
    Icons.calendar_today_outlined,
    Icons.notifications_none_rounded,
    Icons.offline_pin,
    Icons.archive_outlined,
    Icons.folder_open_rounded,
    Icons.settings,
    Icons.help_outline_outlined,
  ];
  @override
  Widget build(BuildContext context) {
    bool isDark = Provider.of<DarkModeController>(context, listen: true).isDark;
    int currNavIndex = Provider.of<NavigationController>(
      context,
      listen: true,
    ).currNavIndex;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Drawer(
      backgroundColor: isDark
          ? const Color.fromARGB(255, 23, 23, 23)
          : Colors.white,
      shape: RoundedRectangleBorder(
        side: BorderSide.none,
        borderRadius: BorderRadius.circular(0),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            color: isDark == false ? Colors.white : Colors.black,
            padding: const EdgeInsets.only(top: 30),
            child: ListTile(
              onTap: () {},
              contentPadding: const EdgeInsets.only(left: 25),
              tileColor: isDark == false ? Colors.white : Colors.black,
              leading: Image.asset(
                'assets/google_text.png',
                fit: BoxFit.cover,
                width: width * 0.25,
              ),
              title: Text(
                'Classroom',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 18,
                  color: isDark ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              children: [
                //
                Divider(
                  height: 0.5,
                  color: isDark ? Colors.white : Colors.black,
                ),
                //
                for (int i = 0; i < 3; i++)
                  Padding(
                    padding: EdgeInsets.only(right: 5),
                    child: ListTile(
                      tileColor: (currNavIndex == (i + 1) && isDark)
                          ? const Color.fromARGB(255, 65, 166, 255)
                          : (currNavIndex == (i + 1) && isDark == false)
                          ? const Color.fromARGB(255, 214, 235, 253)
                          : (currNavIndex != (i + 1) && isDark)
                          ? Colors.black
                          : Colors.white,
                      minTileHeight: 45,
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
                        navIcons[i],
                        color: isDark ? Colors.white : Colors.black,
                      ),
                      title: Text(
                        navTitles[i],
                        style: TextStyle(
                          color: isDark ? Colors.white : Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        context.read<NavigationController>().changeNavIndex(
                          i + 1,
                          context,
                        );
                      },
                    ),
                  ),
                Divider(
                  height: 0.5,
                  color: isDark ? Colors.white : Colors.black,
                ),
                //
                Padding(
                  padding: EdgeInsets.only(
                    left: width * 0.07,
                    top: height * 0.02,
                  ),
                  child: Text(
                    'Enrolled',
                    style: TextStyle(
                      color: isDark ? Colors.white : Colors.black,
                    ),
                  ),
                ),
                //
                SizedBox(height: height * 0.02),
                //
                for (int i = 0; i < classRoomNames.length; i++)
                  NavRecycleItem(
                    text: classRoomNames[i],
                    url: backgrounds[i],
                    color: colors[i],
                    onPressed: () {
                      Navigator.of(context).pop();
                      Get.to(
                        () => InnerScreen(
                          title: classRoomNames[i],
                          background: backgrounds[i],
                          color: colors[i],
                        ),
                      );
                    },
                  ),
                for (int i = 3; i < navTitles.length; i++)
                  Padding(
                    padding: EdgeInsets.only(right: 5),
                    child: ListTile(
                      tileColor: (currNavIndex == (i + 1) && isDark)
                          ? const Color.fromARGB(255, 65, 166, 255)
                          : (currNavIndex == (i + 1) && isDark == false)
                          ? const Color.fromARGB(255, 214, 235, 253)
                          : (currNavIndex != (i + 1) && isDark)
                          ? Colors.black
                          : Colors.white,
                      minTileHeight: 45,
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
                        navIcons[i],
                        color: isDark ? Colors.white : Colors.black,
                      ),
                      title: Text(
                        navTitles[i],
                        style: TextStyle(
                          color: isDark ? Colors.white : Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        context.read<NavigationController>().changeNavIndex(
                          i + 1,
                          context,
                        );
                      },
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
