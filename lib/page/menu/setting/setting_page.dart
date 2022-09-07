import 'dart:ui';

import 'package:awake_life/base/base.dart';
import 'package:awake_life/generated/l10n.dart';
import 'package:awake_life/page/page_export.dart';
import 'package:awake_life/routes/screen_arguments.dart';
import 'package:awake_life/utils/providers/language_provider.dart';
import 'package:awake_life/utils/util_export.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../res/colors.dart';
import '../../../utils/providers/theme_provider.dart';

class SettingPage extends BasePage {
  SettingPage({Key? key}) : super(bloc: SettingBloc());
  static const routeName = '/SettingPage';

  @override
  BasePageState<BasePage<BaseBloc>> getState() => _SettingPageState();
}

class _SettingPageState extends BasePageState<SettingPage> {
  bool? _isThemeDark;
  late bool _checkLanguage;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  void onCreate() {
    String? languageLocal = PrefsUtil.getString(PrefsCache.LANGUAGE_CHANGE);
    _checkLanguage =
        (languageLocal != null && languageLocal == Constants.ENGLISH);
    _isThemeDark = PrefsUtil.getBool(PrefsCache.THEME_APP)!;
    print('_isThemeDark: $_isThemeDark');
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setTheme();
    });
  }

  @override
  void onDestroy() {
    // TODO: implement onDestroy
  }

  Future<void> setTheme() async {
    final provider = Provider.of<ThemeProvider>(context, listen: false);
    if (mounted) {
      provider.toggleTheme(_isThemeDark ?? false);
    }
  }

  Future<void> _moveToNavigationPage(BuildContext context) =>
      Navigator.pushNamedAndRemoveUntil(
          context, NavigationPage.routeName, (route) => false,
          arguments: ScreenArguments(arg1: 4));

  @override
  Widget buildWidget(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        _moveToNavigationPage(context);
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            S.current.setting,
            style: TextStyle(
              color: AppColor.colorWhiteDark,
              fontSize: ScreenUtil.getInstance().getAdapterSize(18),
              fontWeight: FontWeight.w600,
            ),
          ),
          elevation: 1,
          // iconTheme: IconThemeData(color: AppColor.colorWhiteDark),
          backgroundColor: AppColor.colorAppBarDark,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: AppColor.colorWhiteDark,
            ),
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, NavigationPage.routeName, (route) => false,
                  arguments: ScreenArguments(arg1: 4));
            },
          ),
        ),
        body: Container(
          height: ScreenUtil.getInstance().screenHeight,
          width: ScreenUtil.getInstance().screenWidth,
          padding: EdgeInsets.all(ScreenUtil.getInstance().getAdapterSize(16)),
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _itemSettingLanguageWidget(text: S.current.language, onTap: () {
                  showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: AppColor.colorContainerDark,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          )),
                      builder: (context) {
                        return BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                          child: StatefulBuilder(
                            builder: (context, StateSetter state) {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  _headerWidget(),
                                  _radioCheckLanguage(
                                      S.current.vietnamese, _checkLanguage, false),
                                  _radioCheckLanguage(S.current.english, _checkLanguage, true),
                                ],
                              );
                            },
                          ),
                        );
                      });
                }),
                _itemSettingThemeWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _itemSettingLanguageWidget(
      {required String text,
      required GestureTapCallback onTap,
      Color? textColor}) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 0,
      color: Colors.black12,
      child: ListTile(
        leading: SizedBox(
          height: ScreenUtil.getInstance().getAdapterSize(35),
          width: ScreenUtil.getInstance().getAdapterSize(35),
          child: Icon(
            Icons.language,
            size: ScreenUtil.getInstance().getAdapterSize(25),
          ),
        ),
        title: Text(
          text,
          style: TextStyle(color: textColor),
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }

  Widget _itemSettingThemeWidget() {
    final provider = Provider.of<ThemeProvider>(context, listen: false);
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 0,
      color: Colors.black12,
      child: SwitchListTile(
        title: Text(
          S.current.theme,
          style: TextStyle(
              fontSize: ScreenUtil.getInstance().getAdapterSize(15),
              color: AppColor.colorWhiteDark),
        ),
        value: _isThemeDark ?? false,
        onChanged: (bool value) {
          setState(() {
            _isThemeDark = !_isThemeDark!;
            PrefsUtil.putBool(PrefsCache.THEME_APP, value);
            print('_isThemeDark: $value');
            provider.toggleTheme(value);
          });
        },
        activeColor: Colors.green,
        secondary: Icon(
          Icons.color_lens,
          size: ScreenUtil.getInstance().getAdapterSize(25),
        ),
      ),
    );
  }

  Widget _headerWidget() {
    return SizedBox(
      width: ScreenUtil.getInstance().screenWidth,
      height: ScreenUtil.getInstance().getAdapterSize(50),
      child: Stack(
        children: [
          Positioned(
            top: ScreenUtil.getInstance().getAdapterSize(20),
            left: ScreenUtil.getInstance().getAdapterSize(18),
            child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.close)),
          ),
          Center(
            child: Text(
              'Language',
              style: TextStyle(
                  fontSize: ScreenUtil.getInstance().getAdapterSize(16),
                  color: AppColor.colorWhiteDark),
            ),
          ),
        ],
      ),
    );
  }

  Widget _radioCheckLanguage(String language, bool value, bool groupValue) {
    final provider = Provider.of<LanguageProvider>(context, listen: false);
    return RadioListTile(
      title: Text(
        language,
        style: TextStyle(color: AppColor.colorWhiteDark),
      ),
      value: value,
      groupValue: groupValue,
      onChanged: (value) {
        _checkLanguage = !_checkLanguage;
        provider.changeLocale(
            _checkLanguage ? Constants.ENGLISH : Constants.VIETNAMESE);
      },
    );
  }
}
