import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

abstract class BaseBloc {
  final _loadingController = BehaviorSubject<bool>();
  final _msgController = BehaviorSubject<String>();

  Stream<bool> get loadingStream => _loadingController.stream;

  Stream<String> get msgStream => _msgController.stream;

  void onCreate(BuildContext context);

  void dispose();

  void showLoading() {
    _loadingController.sink.add(true);
  }

  void hiddenLoading() {
    _loadingController.sink.add(false);
  }

  void showMsg(String msg) {
    _msgController.sink.add(msg);
  }

  void onDestroy() {
    _loadingController.close();
    _msgController.close();
  }
}
