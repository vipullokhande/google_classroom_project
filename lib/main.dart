import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_classroom_project/controllers/dark_mode_controller.dart';
import 'package:google_classroom_project/controllers/navigation_controller.dart';
import 'package:google_classroom_project/screens/home_screen.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<DarkModeController>(
          create: (context) => DarkModeController(),
        ),
        ChangeNotifierProvider<NavigationController>(
          create: (context) => NavigationController(),
        ),
      ],
      builder: (context, child) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      scrollBehavior: const ScrollBehavior().copyWith(overscroll: false),
      debugShowCheckedModeBanner: false,
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Provider.of<DarkModeController>(context, listen: true).isDark;
    return Consumer(
      builder: (context, darkModeController, child) {
        return Scaffold(
          backgroundColor: isDark ? Colors.black : Colors.white,
          body: const HomeScreen(),
        );
      },
    );
  }
}
