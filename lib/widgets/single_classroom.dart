import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/dark_mode_controller.dart';

enum Item { enroll }

// ignore: must_be_immutable
class SingleClassroomWidget extends StatefulWidget {
  String title;
  String tutor;
  String background;
  // MaterialColor color;
  VoidCallback onPressed;
  SingleClassroomWidget({
    super.key,
    required this.title,
    required this.tutor,
    required this.background,
    // required this.color,
    required this.onPressed,
  });

  @override
  State<SingleClassroomWidget> createState() => _SingleClassroomWidgetState();
}

class _SingleClassroomWidgetState extends State<SingleClassroomWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _colorAnimation = ColorTween(
      begin: Colors.red,
      end: Colors.blue,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Provider.of<DarkModeController>(context, listen: true).isDark;

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    final foregroundColor = isDark ? Colors.white : Colors.black;
    final backgroundColor = isDark ? Colors.black : Colors.white;

    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        height: 160,
        width: double.maxFinite,
        clipBehavior: Clip.antiAlias,
        margin: const EdgeInsets.symmetric(
          vertical: 6,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(width: 0),
          color: Colors.white,
        ),
        child: Stack(
          children: [
            Image.network(
              widget.background,
              height: double.maxFinite,
              width: double.maxFinite,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) =>
                  loadingProgress != null
                      ? Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              width: 1,
                              color: Colors.black,
                            ),
                          ),
                          child: Center(
                            child: CircularProgressIndicator.adaptive(
                              value: loadingProgress.cumulativeBytesLoaded
                                  .toDouble(),
                              backgroundColor: Colors.white,
                              valueColor: _colorAnimation,
                            ),
                          ),
                        )
                      : child,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.05,
                    ),
                    Text(
                      widget.title,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 21,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
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
                            value: Item.enroll,
                            child: Text(
                              'Enroll',
                              style: TextStyle(
                                color: foregroundColor,
                              ),
                            ),
                          ),
                        ];
                      },
                    ),
                  ],
                ),
                const Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                  child: Text(
                    widget.tutor,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.020,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
