// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../controllers/dark_mode_controller.dart';

class NavRecycleItem extends StatelessWidget {
  String text;
  String url;
  Color color;
  VoidCallback onPressed;
  NavRecycleItem({
    super.key,
    required this.text,
    required this.color,
    required this.url,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Provider.of<DarkModeController>(context, listen: true).isDark;

    // List<MaterialColor> colors = [
    //   Colors.amber,
    //   Colors.pink,
    //   Colors.blue,
    //   Colors.green,
    //   Colors.orange,
    //   Colors.brown,
    //   Colors.purple,
    // ];
    // Random random = Random();

    // final backgroundColor = isDark ? Colors.black : Colors.white;
    final foregroundColor = isDark ? Colors.white : Colors.black;

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return ResponsiveBuilder(builder: ((context, sizingInformation) {
      var navItemHeight =
          sizingInformation.deviceScreenType == DeviceScreenType.mobile
              ? height * 0.075
              : height * 0.1;
      return Container(
        alignment: Alignment.center,
        height: navItemHeight,
        width: double.maxFinite,
        clipBehavior: Clip.antiAlias,
        margin: EdgeInsets.symmetric(
          horizontal: width * 0.015,
          vertical: height * 0.004,
        ),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
          image: DecorationImage(
            image: NetworkImage(url),
            fit: BoxFit.cover,
          ),
        ),
        child: ListTile(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: width * 0.045,
            vertical: 0,
          ),
          leading: CircleAvatar(
            // backgroundColor: colors[random.nextInt(7)],
            backgroundColor: color,
            radius: 22,
            child: Text(
              getInitials(fullName: text),
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          title: Text(
            text,
            style: TextStyle(
              color: foregroundColor,
              fontSize: 15,
              overflow: TextOverflow.ellipsis,
            ),
            maxLines: 1,
          ),
          onTap: onPressed,
          tileColor: Colors.transparent,
        ),
      );
    }));
  }
}

String getInitials({required String fullName}) {
  List<String> names = fullName.split(" ");
  String initials = '';
  for (var i = 0; i < names.length; i++) {
    initials += names[i][0];
  }
  return initials;
}
