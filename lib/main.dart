import 'dart:io';

import 'package:flutter/material.dart';
import 'package:reefscape_scoring_robotbirds/scoring_page/scoring_page.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if(Platform.isWindows) {
    await windowManager.ensureInitialized();

    WindowOptions windowOptions = const WindowOptions(
      size: Size(1700, 900),
      minimumSize: Size(1300, 850),
      center: true,
      title: 'Dashboard',
    );
    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
    });
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: '1672 Reefscape App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        useMaterial3: true,
      ),
      home: getApp()
    );
  }
  Widget getApp() {
    if(Platform.isAndroid) {
      return Center(
        child: Text("Unfortunately, due to limitations of Flutter and USB, Android, or any other operating system besides Windows is not supported. \nPlease run this software on a second touchscreen monitor.\n - Team 1672", style: TextStyle(fontSize: 48, fontFamily: "BebasNeue"),),
      );
    }
    return ScoringPage();
  }
}