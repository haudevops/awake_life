import 'package:awake_life/base/base.dart';
import 'package:awake_life/page/page_export.dart';
import 'package:flutter/material.dart';

class EventsPage extends BasePage {
  EventsPage({Key? key}) : super(bloc: EventsBloc());
  static const routeName = '/EventsPage';

  @override
  BasePageState<BasePage<BaseBloc>> getState() => _EventsPageState();
}

class _EventsPageState extends BasePageState<EventsPage> {
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
