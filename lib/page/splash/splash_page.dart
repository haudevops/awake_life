import 'package:awake_life/page/page_export.dart';
import 'package:awake_life/utils/util_export.dart';
import 'package:awake_life/widget/widget_export.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);
  static const routeName = '/SplashPage';

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  void initState() {
    _checkToken();
    super.initState();
  }

  Future<void> _checkToken() async {
    final SharedPreferences prefs = await _prefs;
    final isLogin = prefs.getBool(PrefsCache.IS_LOGIN) ?? false;
    Future.delayed(const Duration(seconds: 3), () {
      isLogin
          ? Navigator.pushNamed(context, NavigationPage.routeName)
          : Navigator.pushNamed(context, LoginPage.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: ScreenUtil.getInstance().screenWidth,
        height: ScreenUtil.getInstance().screenHeight,
        color: Colors.orangeAccent[50],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Icon(
                Icons.flutter_dash,
                size: ScreenUtil.getInstance().getAdapterSize(80),
              ),
            ),
            getLoadingWidget()
          ],
        ),
      ),
    );
  }
}
