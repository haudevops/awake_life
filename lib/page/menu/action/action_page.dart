import 'package:awake_life/base/base.dart';
import 'package:awake_life/page/page_export.dart';
import 'package:flutter/material.dart';

class ActionPage extends BasePage {
  ActionPage({Key? key}) : super(bloc: ActionBloc());
  static const routeName = '/ActionPage';

  @override
  BasePageState<BasePage<BaseBloc>> getState() => _ActionPageState();
}

class _ActionPageState extends BasePageState<ActionPage> {
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
