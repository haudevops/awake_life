import 'package:awake_life/base/base.dart';
import 'package:awake_life/page/page_export.dart';
import 'package:flutter/material.dart';

class MenuPage extends BasePage{
  MenuPage({Key? key}) : super(bloc: MenuBloc());
  static const routeName = '/MenuPage';

  @override
  BasePageState<BasePage<BaseBloc>> getState() => _MenuPageState();

}

class _MenuPageState extends BasePageState<MenuPage>{
  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold();
  }

  @override
  void onCreate() {
    // TODO: implement onCreate
  }

  @override
  void onDestroy() {
    // TODO: implement onDestroy
  }

}