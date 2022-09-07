import 'package:awake_life/page/page_export.dart';
import 'package:awake_life/routes/router_setting.dart';
import 'package:awake_life/utils/providers/language_provider.dart';
import 'package:awake_life/utils/providers/theme_provider.dart';
import 'package:awake_life/utils/util_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'generated/l10n.dart';

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
      builder: () => MultiProvider(
        providers: [
          ChangeNotifierProvider<LanguageProvider>(
              create: (context) => LanguageProvider()),
          ChangeNotifierProvider<ThemeProvider>(
            create: (context) => ThemeProvider(),
          ),
        ],
        child: Builder(
          builder: (context) {
            return MaterialApp(
              title: 'Awake Life',
              debugShowCheckedModeBanner: false,
              locale: Provider.of<LanguageProvider>(context, listen: true)
                  .currentLocale,
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              onGenerateRoute: RoutesSetting.allRoutes,
              home: SplashPage(),
            );
          }
        ),
      ),
    );
  }
}
