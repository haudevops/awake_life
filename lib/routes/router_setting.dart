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
      case NavigationPage.routeName:
        return SlideLeftRoute(NavigationPage(data: arg));
      case MapPage.routeName:
        return SlideLeftRoute(MapPage());
      case NotificationPage.routeName:
        return SlideLeftRoute(NotificationPage());
      case MenuPage.routeName:
        return SlideLeftRoute(MenuPage());
      case SettingPage.routeName:
        return SlideLeftRoute(SettingPage());
      case InfoPage.routeName:
        return SlideLeftRoute(InfoPage());
      default:
        throw ('this route name does not exist');
    }
  }
}