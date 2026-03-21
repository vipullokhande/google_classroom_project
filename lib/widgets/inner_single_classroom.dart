import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InnerSingleClassroomWidget extends StatelessWidget {
  String title;
  String background;
  InnerSingleClassroomWidget({
    Key? key,
    required this.title,
    required this.background,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // bool isDark = Provider.of<DarkModeController>(context, listen: true).isDark;

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      height: height * 0.16,
      width: double.maxFinite,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(background),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.07),
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            height: height * 0.01,
          )
        ],
      ),
    );
  }
}
