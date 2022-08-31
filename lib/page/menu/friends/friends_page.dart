import 'package:awake_life/base/base.dart';
import 'package:awake_life/page/page_export.dart';
import 'package:flutter/material.dart';

class FriendsPage extends BasePage {
  FriendsPage({Key? key}) : super(bloc: FriendsBloc());
  static const routeName = '/FriendsPage';

  @override
  BasePageState<BasePage<BaseBloc>> getState() {
    // TODO: implement getState
    throw UnimplementedError();
  }
}

class _FriendsPageState extends BasePageState<FriendsPage> {
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
