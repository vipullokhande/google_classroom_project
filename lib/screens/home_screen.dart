import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_classroom_project/controllers/navigation_controller.dart';
import 'package:google_classroom_project/screens/inner_screen.dart';
import 'package:google_classroom_project/widgets/dialog_profile_tile.dart';
import 'package:google_classroom_project/widgets/profile_text_icon_tile.dart';
import 'package:google_classroom_project/widgets/scaffold_widget.dart';
import 'package:google_classroom_project/widgets/single_classroom.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../controllers/dark_mode_controller.dart';
import '../widgets/nav_recycle_item.dart';

enum AppItem { refresh, send }

enum AccountItem { remove }

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final globalKey = GlobalKey<ScaffoldState>();
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    bool isDark = Provider.of<DarkModeController>(context, listen: true).isDark;
    int currNavIndex = Provider.of<NavigationController>(
      context,
      listen: true,
    ).currNavIndex;

    final backgroundColor = isDark ? Colors.black : Colors.white;
    final foregroundColor = isDark ? Colors.white : Colors.black;

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    List<String> tutors = [
      'Prof ABC',
      'Prof DEF',
      'Prof GHI',
      'Prof ABC',
      'Prof DEF',
      'Prof GHI',
      'Prof ABC',
      'Prof DEF',
      'Prof GHI',
      'Prof ABC',
      'Prof DEF',
      'Prof GHI',
    ];
    List<String> backgrounds = [
      'https://otus.com/wp-content/uploads/2020/09/2-1024x576.png',
      'https://media.istockphoto.com/id/1314385575/photo/kindergarten-classroom-and-frame-for-mockup-3d-rendering.jpg?s=612x612&w=is&k=20&c=d0nS6WSqoi7aYc4NExyotr759aDSwb8w3LQDsz8JwBs=',
      'https://media.istockphoto.com/id/1205276835/vector/empty-classroom-interior-school-or-college-class.jpg?s=612x612&w=0&k=20&c=K9fFk7oxhT4ztcaPI0hrhDxajR_6dzyMwUsSi0jP1Lg=',
      'https://otus.com/wp-content/uploads/2020/09/2-1024x576.png',
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
    Widget buildNavItem({
      required String title,
      required IconData icon,
      required VoidCallback onTap,
      required int i,
    }) {
      return ListTile(
        tileColor: (currNavIndex == i && isDark)
            ? const Color.fromARGB(255, 65, 166, 255)
            : (currNavIndex == i && isDark == false)
            ? const Color.fromARGB(255, 214, 235, 253)
            : (currNavIndex != i && isDark)
            ? Colors.black
            : Colors.white,
        minTileHeight: 45,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 25, vertical: 2),
        leading: Icon(icon, color: isDark ? Colors.white : Colors.black),
        title: Text(
          title,
          style: TextStyle(
            color: isDark ? Colors.white : Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        onTap: onTap,
      );
    }

    // Random random = Random();
    return ResponsiveBuilder(
      builder: ((context, sizingInformation) {
        var navWidth =
            sizingInformation.deviceScreenType == DeviceScreenType.mobile
            ? width * 0.70
            : width * 0.3;
        var resWidth =
            sizingInformation.deviceScreenType == DeviceScreenType.mobile
            ? width * 0.25
            : width * 0.12;
        // var resSCWidth =
        //     sizingInformation.deviceScreenType == DeviceScreenType.mobile
        //         ? double.maxFinite
        //         : width * 0.7;
        return ScaffoldWidget(
          key: globalKey,
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: backgroundColor,
            foregroundColor: foregroundColor,
            elevation: 0,
            title: const Text(
              'Google Classroom',
              style: TextStyle(fontSize: 20),
            ),
            actions: [
              GestureDetector(
                onTap: () => showDialog(
                  context: context,
                  builder: (_) {
                    return Dialog(
                      insetPadding: const EdgeInsets.symmetric(horizontal: 10),
                      backgroundColor: isDark
                          ? const Color.fromRGBO(65, 65, 65, 1)
                          : Colors.white,
                      clipBehavior: Clip.antiAlias,
                      alignment: Alignment.center,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(
                          width: 1,
                          color: isDark
                              ? const Color.fromRGBO(65, 65, 65, 1)
                              : Colors.white,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                        ).copyWith(top: 4),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  icon: Icon(
                                    Icons.close_rounded,
                                    color: foregroundColor,
                                    size: 26,
                                  ),
                                ),
                                const Spacer(flex: 1),
                                Image.asset(
                                  'assets/google_text.png',
                                  color: isDark ? Colors.white : Colors.black,
                                  fit: BoxFit.fill,
                                  height: 30,
                                  width: 100,
                                ),
                                const Spacer(flex: 2),
                              ],
                            ),
                            Container(
                              clipBehavior: Clip.antiAlias,
                              margin: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              decoration: BoxDecoration(
                                color: isDark
                                    ? const Color.fromRGBO(41, 41, 41, 1)
                                    : Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: ListView(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                children: [
                                  Theme(
                                    data: ThemeData(
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                    ),
                                    child: ExpansionTile(
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20),
                                        ),
                                        side: BorderSide.none,
                                      ),
                                      collapsedShape:
                                          const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20),
                                            ),
                                            side: BorderSide.none,
                                          ),
                                      tilePadding: const EdgeInsets.all(0),
                                      childrenPadding: const EdgeInsets.all(0),
                                      title: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          DialogProfileTile(
                                            foregroundColor: foregroundColor,
                                            imgName: "vip",
                                            username: "Vipul Lokhande",
                                            useremail:
                                                "vipullokhande1@gmail.com",
                                          ),
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                left: 50,
                                              ),
                                              child: TextButton(
                                                onPressed: () {},
                                                style: TextButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          12,
                                                        ),
                                                    side: BorderSide(
                                                      width: 1,
                                                      color: isDark
                                                          ? Colors.white
                                                          : Colors.black87,
                                                    ),
                                                  ),
                                                  padding:
                                                      const EdgeInsets.only(
                                                        top: 0,
                                                        bottom: 0,
                                                        left: 10,
                                                        right: 10,
                                                      ),
                                                ),
                                                child: Text(
                                                  "Google Account",
                                                  style: TextStyle(
                                                    color: isDark
                                                        ? Colors.white
                                                        : Colors.black87,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      trailing: Padding(
                                        padding: const EdgeInsets.only(
                                          bottom: 40,
                                          right: 10,
                                        ),
                                        child: Icon(
                                          Icons.arrow_drop_down_circle_outlined,
                                          color: Colors.grey.shade700,
                                          size: 28,
                                        ),
                                      ),
                                      children: [
                                        Divider(
                                          height: 1,
                                          thickness: 2.5,
                                          color: isDark
                                              ? const Color.fromRGBO(
                                                  65,
                                                  65,
                                                  65,
                                                  1,
                                                )
                                              : Colors.white,
                                        ),
                                        DialogProfileTile(
                                          foregroundColor: foregroundColor,
                                          imgName: "l",
                                          username: "Vipul Lokhande",
                                          useremail:
                                              "lokhande.vipul@kgce.edu.in",
                                        ),
                                        DialogProfileTile(
                                          foregroundColor: foregroundColor,
                                          imgName: "c",
                                          username: "Corbin Office",
                                          useremail: "corbinoffice76@gmail.com",
                                        ),
                                        Divider(
                                          height: 1,
                                          thickness: 2.5,
                                          color: isDark
                                              ? const Color.fromRGBO(
                                                  65,
                                                  65,
                                                  65,
                                                  1,
                                                )
                                              : Colors.white,
                                        ),
                                        ListTile(
                                          contentPadding: EdgeInsets.only(
                                            left: width * 0.07,
                                          ),
                                          leading: Icon(
                                            Icons.group_add_outlined,
                                            color: foregroundColor,
                                          ),
                                          title: Text(
                                            'Add another account',
                                            style: TextStyle(
                                              color: foregroundColor,
                                            ),
                                          ),
                                          onTap: () {},
                                        ),
                                        ListTile(
                                          contentPadding: EdgeInsets.only(
                                            left: width * 0.07,
                                          ),
                                          leading: Icon(
                                            Icons.person_search_outlined,
                                            color: foregroundColor,
                                          ),
                                          title: Text(
                                            'Manage accounts on this device',
                                            style: TextStyle(
                                              color: foregroundColor,
                                            ),
                                          ),
                                          onTap: () {},
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    height: 1,
                                    thickness: 2.5,
                                    color: isDark
                                        ? const Color.fromRGBO(65, 65, 65, 1)
                                        : Colors.white,
                                  ),
                                  ProfileTextIconTile(
                                    foregroundColor: foregroundColor,
                                    width: width,
                                    icon: Icons.notifications_none,
                                    text: "Notifications & offers",
                                  ),
                                  ProfileTextIconTile(
                                    foregroundColor: foregroundColor,
                                    width: width,
                                    icon: Icons.folder_outlined,
                                    text: "Library",
                                  ),
                                  ProfileTextIconTile(
                                    foregroundColor: foregroundColor,
                                    width: width,
                                    icon: Icons.settings,
                                    text: "Settings",
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                child: ClipOval(
                  child: Image.asset(
                    'assets/vip.png',
                    height: 40,
                    width: 40,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              PopupMenuButton(
                splashRadius: 10,
                color: backgroundColor,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                  side: BorderSide(color: foregroundColor, width: 1),
                ),
                itemBuilder: (context) {
                  return [
                    PopupMenuItem(
                      value: AppItem.refresh,
                      child: Text(
                        'Refresh',
                        style: TextStyle(color: foregroundColor),
                      ),
                    ),
                    PopupMenuItem(
                      value: AppItem.send,
                      child: Text(
                        'Send Google Feedback',
                        style: TextStyle(color: foregroundColor),
                      ),
                    ),
                  ];
                },
              ),
            ],
            bottom: PreferredSize(
              preferredSize: Size(width, 2),
              child: Divider(height: 2, color: foregroundColor),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.blue,
            child: Icon(
              Icons.dark_mode,
              color: isDark ? Colors.white : Colors.black,
            ),
            onPressed: () => isDark
                ? context.read<DarkModeController>().changeToLight()
                : context.read<DarkModeController>().changeToDark(),
          ),
          drawer: Drawer(
            backgroundColor: isDark
                ? const Color.fromARGB(255, 23, 23, 23)
                : Colors.white,
            width: navWidth,
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
                      width: resWidth,
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
                    controller: scrollController,
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
                          padding: const EdgeInsets.only(right: 5),
                          child: buildNavItem(
                            i: i + 1,
                            title: navTitles[i],
                            icon: navIcons[i],
                            onTap: () => context
                                .read<NavigationController>()
                                .changeNavIndex(i + 1, context, globalKey),
                          ),
                        ),
                      //
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
                          onPressed: () => Get.to(
                            () => InnerScreen(
                              title: classRoomNames[i],
                              background: backgrounds[i],
                              color: colors[i],
                            ),
                          ),
                        ),
                      // NavRecycleItem(text: classRoomNames[0]),
                      // NavRecycleItem(text: classRoomNames[1]),
                      // NavRecycleItem(text: classRoomNames[2]),
                      // NavRecycleItem(text: classRoomNames[3]),
                      // NavRecycleItem(text: classRoomNames[4]),
                      // NavRecycleItem(text: classRoomNames[5]),
                      // NavRecycleItem(text: classRoomNames[6]),
                      // NavRecycleItem(text: classRoomNames[7]),
                      // NavRecycleItem(text: classRoomNames[8]),
                      // NavRecycleItem(text: classRoomNames[9]),
                      // NavRecycleItem(text: classRoomNames[10]),
                      // NavRecycleItem(text: classRoomNames[11]),
                      for (int i = 3; i < navTitles.length; i++)
                        buildNavItem(
                          i: i + 1,
                          title: navTitles[i],
                          icon: navIcons[i],
                          onTap: () {},
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          body: RefreshIndicator(
            color: foregroundColor,
            backgroundColor: backgroundColor,
            displacement: 50,
            strokeWidth: 3,
            onRefresh: () async {},
            child: LayoutBuilder(
              builder: (_, constraints) {
                if (constraints.maxWidth > 700) {
                  return Row(
                    children: [
                      SizedBox(
                        width: width * 0.3,
                        child: ListView(
                          scrollDirection: Axis.vertical,
                          children: [
                            ListTile(
                              contentPadding: const EdgeInsets.only(left: 25),
                              leading: Image.asset(
                                'assets/google_text.png',
                                fit: BoxFit.cover,
                                width: resWidth,
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
                            //
                            Divider(
                              height: 0.5,
                              color: isDark ? Colors.white : Colors.black,
                            ),
                            //
                            for (int i = 0; i < 3; i++)
                              buildNavItem(
                                i: i + 1,
                                title: navTitles[i],
                                icon: navIcons[i],
                                onTap: () {},
                              ),
                            //
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
                                onPressed: () => Get.to(
                                  () => InnerScreen(
                                    title: classRoomNames[i],
                                    background: backgrounds[i],
                                    color: colors[i],
                                  ),
                                ),
                              ),
                            // NavRecycleItem(text: classRoomNames[0]),
                            // NavRecycleItem(text: classRoomNames[1]),
                            // NavRecycleItem(text: classRoomNames[2]),
                            // NavRecycleItem(text: classRoomNames[3]),
                            // NavRecycleItem(text: classRoomNames[4]),
                            // NavRecycleItem(text: classRoomNames[5]),
                            // NavRecycleItem(text: classRoomNames[6]),
                            // NavRecycleItem(text: classRoomNames[7]),
                            // NavRecycleItem(text: classRoomNames[8]),
                            // NavRecycleItem(text: classRoomNames[9]),
                            // NavRecycleItem(text: classRoomNames[10]),
                            // NavRecycleItem(text: classRoomNames[11]),
                            for (int i = 3; i < navTitles.length; i++)
                              buildNavItem(
                                i: i + 1,
                                title: navTitles[i],
                                icon: navIcons[i],
                                onTap: () {},
                              ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: width * 0.7,
                        child: ListView.builder(
                          itemCount: classRoomNames.length,
                          scrollDirection: Axis.vertical,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                          ).add(const EdgeInsets.only(top: 7, bottom: 7)),
                          itemBuilder: (context, index) {
                            var title = classRoomNames[index];
                            var tutor = tutors[index];
                            var background = backgrounds[index];
                            // final r = random.nextInt(7);
                            return SingleClassroomWidget(
                              title: title,
                              tutor: tutor,
                              background: background,
                              // color: colors[index],
                              onPressed: () => Get.to(
                                () => InnerScreen(
                                  title: classRoomNames[index],
                                  background: backgrounds[index],
                                  color: colors[index],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                }
                return ListView.builder(
                  itemCount: classRoomNames.length,
                  scrollDirection: Axis.vertical,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ).add(const EdgeInsets.only(top: 7, bottom: 7)),
                  itemBuilder: (context, index) {
                    var title = classRoomNames[index];
                    var tutor = tutors[index];
                    var background = backgrounds[index];
                    // final r = random.nextInt(7);
                    return SingleClassroomWidget(
                      title: title,
                      tutor: tutor,
                      background: background,
                      // color: colors[index],
                      onPressed: () => Get.to(
                        () => InnerScreen(
                          title: classRoomNames[index],
                          background: backgrounds[index],
                          color: colors[index],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            // child:
            //  ScreenTypeLayout(
            //   desktop: Row(
            //     children: [
            //       ,
            //       ListView.builder(
            //         itemCount: classRoomNames.length,
            //         scrollDirection: Axis.vertical,
            //         padding: const EdgeInsets.symmetric(
            //           horizontal: 10,
            //         ).add(
            //           const EdgeInsets.only(
            //             top: 7,
            //             bottom: 7,
            //           ),
            //         ),
            //         itemBuilder: (context, index) {
            //           var title = classRoomNames[index];
            //           var tutor = tutors[index];
            //           var background = backgrounds[index];
            //           // final r = random.nextInt(7);
            //           return SingleClassroomWidget(
            //             title: title,
            //             tutor: tutor,
            //             background: background,
            //             // color: colors[index],
            //             onPressed: () => Get.to(
            //               () => InnerScreen(
            //                 title: classRoomNames[index],
            //                 background: backgrounds[index],
            //                 color: colors[index],
            //               ),
            //             ),
            //           );
            //         },
            //       )
            //     ],
            //   ),
            //   mobile: ListView.builder(
            //     itemCount: classRoomNames.length,
            //     scrollDirection: Axis.vertical,
            //     padding: const EdgeInsets.symmetric(
            //       horizontal: 10,
            //     ).add(
            //       const EdgeInsets.only(
            //         top: 7,
            //         bottom: 7,
            //       ),
            //     ),
            //     itemBuilder: (context, index) {
            //       var title = classRoomNames[index];
            //       var tutor = tutors[index];
            //       var background = backgrounds[index];
            //       // final r = random.nextInt(7);
            //       return SingleClassroomWidget(
            //         title: title,
            //         tutor: tutor,
            //         background: background,
            //         // color: colors[index],
            //         onPressed: () => Get.to(
            //           () => InnerScreen(
            //             title: classRoomNames[index],
            //             background: backgrounds[index],
            //             color: colors[index],
            //           ),
            //         ),
            //       );
            //     },
            //   ),
            // ),
          ),
        );
      }),
    );
  }
}
