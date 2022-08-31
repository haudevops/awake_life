import 'package:awake_life/base/base.dart';
import 'package:awake_life/page/page_export.dart';
import 'package:flutter/material.dart';

class InfoPage extends BasePage {
  InfoPage({Key? key}) : super(bloc: InfoBloc());
  static const routeName = '/InfoPage';

  @override
  BasePageState<BasePage<BaseBloc>> getState() => _InfoPageState();
}

class _InfoPageState extends BasePageState<InfoPage> {
  @override
  void onCreate() {
    // TODO: implement onCreate
  }

  @override
  void onDestroy() {
    // TODO: implement onDestroy
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold();
  }
}
