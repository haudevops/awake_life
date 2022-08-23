import 'package:awake_life/base/base.dart';
import 'package:awake_life/page/page_export.dart';
import 'package:flutter/material.dart';

class SocialPage extends BasePage{
  SocialPage({Key? key}) : super(bloc: SocialBloc());
  static const routeName = '/SocialPage';

  @override
  BasePageState<BasePage<BaseBloc>> getState() => _SocialPageState();

}

class _SocialPageState extends BasePageState<SocialPage>{
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