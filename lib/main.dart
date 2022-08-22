import 'package:awake_life/page/page_export.dart';
import 'package:awake_life/routes/router_setting.dart';
import 'package:awake_life/utils/util_export.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(411, 820),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: () => const MaterialApp(
        title: 'Awake Life',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RoutesSetting.allRoutes,
        home: SplashPage(),
      ),
    );
  }
}

