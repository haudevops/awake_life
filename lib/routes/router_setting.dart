import 'package:awake_life/page/page_export.dart';
import 'package:awake_life/routes/screen_arguments.dart';
import 'package:awake_life/routes/slide_left_route.dart';
import 'package:flutter/material.dart';

class RoutesSetting {
  static Route<dynamic> allRoutes(RouteSettings settings){
    late ScreenArguments arg;
    final Object? arguments = settings.arguments;
    if (arguments != null) {
      arg = arguments as ScreenArguments;
    }
    switch (settings.name){
      case SplashPage.routeName:
        return SlideLeftRoute(const SplashPage());
      case LoginPage.routeName:
        return SlideLeftRoute(LoginPage());
      case HomePage.routeName:
        return SlideLeftRoute(HomePage());
      default:
        throw ('this route name does not exist');
    }
  }
}