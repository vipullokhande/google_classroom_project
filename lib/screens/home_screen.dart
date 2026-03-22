import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_classroom_project/screens/inner_screen.dart';
import 'package:google_classroom_project/widgets/dialog_profile_tile.dart';
import 'package:google_classroom_project/widgets/drawer_widget.dart';
import 'package:google_classroom_project/widgets/profile_text_icon_tile.dart';
import 'package:google_classroom_project/widgets/scaffold_widget.dart';
import 'package:google_classroom_project/widgets/single_classroom.dart';
import 'package:provider/provider.dart';
import '../controllers/dark_mode_controller.dart';

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

    final backgroundColor = isDark ? Colors.black : Colors.white;
    final foregroundColor = isDark ? Colors.white : Colors.black;
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

    return ScaffoldWidget(
      key: globalKey,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        elevation: 0,
        title: const Text('Google Classroom', style: TextStyle(fontSize: 20)),
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
                          margin: const EdgeInsets.symmetric(horizontal: 10),
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
                                  collapsedShape: const RoundedRectangleBorder(
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
                                        useremail: "vipullokhande1@gmail.com",
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
                                                    BorderRadius.circular(12),
                                                side: BorderSide(
                                                  width: 1,
                                                  color: isDark
                                                      ? Colors.white
                                                      : Colors.black87,
                                                ),
                                              ),
                                              padding: const EdgeInsets.only(
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
                                          ? const Color.fromRGBO(65, 65, 65, 1)
                                          : Colors.white,
                                    ),
                                    DialogProfileTile(
                                      foregroundColor: foregroundColor,
                                      imgName: "l",
                                      username: "Vipul Lokhande",
                                      useremail: "lokhande.vipul@kgce.edu.in",
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
                                          ? const Color.fromRGBO(65, 65, 65, 1)
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
      drawer: DrawerWidget(),
      body: RefreshIndicator(
        color: foregroundColor,
        backgroundColor: backgroundColor,
        displacement: 50,
        strokeWidth: 3,
        onRefresh: () async {},
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
    );
  }
}
