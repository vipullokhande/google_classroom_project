import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_classroom_project/controllers/dark_mode_controller.dart';
import 'package:google_classroom_project/models/new_material.dart';
import 'package:google_classroom_project/screens/insert_new_material.dart';
import 'package:google_classroom_project/widgets/classwork_widget.dart';
import 'package:google_classroom_project/widgets/custom_bottom_navigation_bar.dart';
import 'package:google_classroom_project/widgets/inner_single_classroom.dart';
import 'package:google_classroom_project/widgets/new_material_widget.dart';
import 'package:google_classroom_project/widgets/scaffold_widget.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class InnerScreen extends StatefulWidget {
  String title;
  String background;
  Color color;
  InnerScreen({
    super.key,
    required this.title,
    required this.background,
    required this.color,
  });

  @override
  State<InnerScreen> createState() => _InnerScreenState();
}

class _InnerScreenState extends State<InnerScreen> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    bool isDark = Provider.of<DarkModeController>(context, listen: true).isDark;

    List<String> teachersList = ['Teacher'];

    List<String> classmates = [
      'Person 1',
      'Person 2',
      'Person 3',
      'Person 4',
      'Person 5',
      'Person 6',
      'Person 7',
      'Person 8',
      'Person 9',
      'Person 10',
    ];

    List<NewMaterial> materials = [
      NewMaterial(title: 'First Experiment', time: 'Feb 4'),
      NewMaterial(title: 'Second Experiment', time: 'Feb 5'),
      NewMaterial(title: 'Third Experiment', time: 'Feb 6'),
      NewMaterial(title: 'Fourth Experiment', time: 'Feb 7'),
      NewMaterial(title: 'Fifth Experiment', time: 'Feb 8'),
      NewMaterial(title: 'Sixth Experiment', time: 'Feb 8'),
    ];

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    final foregroundColor = isDark ? Colors.white : Colors.black;
    final backgroundColor = isDark
        ? Colors.black
        : const Color.fromARGB(255, 238, 238, 238);

    return ScaffoldWidget(
      appBar: AppBar(
        toolbarHeight: height * 0.085,
        elevation: 0,
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
          ),
        ),
        title: index == 2
            ? Text(
                widget.title,
                style: TextStyle(color: widget.color, fontSize: 16),
              )
            : const Text(''),
        actions: [
          if (index == 0)
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.info_outline_rounded, color: foregroundColor),
            )
          else if (index == 1)
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.person_pin_outlined, color: foregroundColor),
            ),
          //
        ],
      ),
      body: IndexedStack(
        index: index,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: width * 0.02),
            color: Colors.transparent,
            height: height,
            width: width,
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                InnerSingleClassroomWidget(
                  title: widget.title,
                  background: widget.background,
                ),
                SizedBox(height: height * 0.015),
                ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  tileColor: isDark
                      ? const Color.fromARGB(255, 43, 43, 43)
                      : Colors.white,
                  leading: const CircleAvatar(
                    backgroundImage: AssetImage('assets/user.png'),
                    backgroundColor: Colors.white,
                  ),
                  title: Text(
                    'Share with your class ',
                    style: TextStyle(
                      fontSize: 14,
                      color: isDark
                          ? const Color.fromARGB(255, 214, 214, 214)
                          : Colors.black,
                    ),
                  ),
                  onTap: () {
                    Get.to(() => const InsertNewMaterial());
                  },
                ),
                SizedBox(height: height * 0.015),
                //
                materials.isNotEmpty
                    ? SizedBox(
                        height: height,
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: materials.length,
                          itemBuilder: (context, index) {
                            return NewMaterialWidget(
                              title: materials[index].title,
                              time: materials[index].time,
                              color: widget.color,
                            );
                          },
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
          ),
          //
          Container(
            height: height,
            width: width,
            color: backgroundColor,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: materials.length,
              itemBuilder: (context, index) {
                return ClassworkWidget(
                  title: materials[index].title,
                  time: materials[index].time,
                  color: widget.color,
                );
              },
            ),
          ),
          //
          Container(
            height: height,
            width: width,
            color: backgroundColor,
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.07,
                    vertical: height * 0.01,
                  ),
                  child: Text(
                    'Teachers',
                    style: TextStyle(color: widget.color, fontSize: 24),
                  ),
                ),
                for (int i = 0; i < teachersList.length; i++)
                  ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 7,
                    ),
                    leading: CircleAvatar(
                      backgroundColor: widget.color,
                      radius: width * 0.065,
                      child: Image.asset('assets/user.png'),
                    ),
                    title: Text(
                      teachersList[i],
                      style: TextStyle(
                        color: foregroundColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    onTap: () {},
                  ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.07,
                    vertical: height * 0.01,
                  ),
                  child: Text(
                    'Classmates',
                    style: TextStyle(color: widget.color, fontSize: 24),
                  ),
                ),
                for (int i = 0; i < classmates.length; i++)
                  ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 7,
                    ),
                    leading: CircleAvatar(
                      backgroundColor: widget.color,
                      radius: width * 0.065,
                      child: Image.asset('assets/user.png'),
                    ),
                    title: Text(
                      classmates[i],
                      style: TextStyle(
                        color: foregroundColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    onTap: () {},
                  ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        index: index,
        backColor: context.watch<DarkModeController>().isDark
            ? Colors.black
            : Colors.white,
        selectedColor: widget.color,
        onTap: (p0) => setState(() {
          index = p0;
        }),
      ),
    );
  }
}
