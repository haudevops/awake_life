import 'package:awake_life/widget/dialog/dialog_internet_connection.dart';
import 'package:awake_life/widget/holder_widget.dart';
import 'package:awake_life/widget/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../utils/screen_util.dart';

abstract class BaseFunction {
  BuildContext? _contextBaseFunction;
  late State _stateBaseFunction;
  bool isShowLoading = false;
  late FToast _fToast;

  void initBaseCommon(State state) {
    _stateBaseFunction = state;
    _contextBaseFunction = state.context;
    _fToast = FToast();
    _fToast.init(state.context);
  }

  void onCreate();

  void onResume() {}

  void onPause() {}

  Widget buildWidget(BuildContext context);

  void onBackground() {}

  void onForeground() {}

  void onDestroy();

  String getWidgetName() {
    if (_contextBaseFunction == null) {
      return "";
    }
    String className = _contextBaseFunction.toString();

    // if (environment != Constants.PROD_ENVIRONMENT) {
    //   try {
    //     className = className.substring(0, className.indexOf("("));
    //   } catch (err) {
    //     className = "";
    //   }
    //   return className;
    // }

    return className;
  }

  void showLoading(bool isLoading) {
    if (_stateBaseFunction.mounted) {
      _stateBaseFunction.setState(() {
        isShowLoading = isLoading;
      });
    }
  }

  void showDialogInternetConnect(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        useRootNavigator: false,
        builder: (context) {
          return DialogInternetConnect();
        });
  }

  Widget getBaseView(BuildContext context) {
    return Stack(
      children: [
        buildWidget(context),
        isShowLoading ? getLoadingWidget() : getHolderLWidget(),
      ],
    );
  }

  void showToast(String content, bool colorStatus,
      {Toast length = Toast.LENGTH_SHORT,
      ToastGravity gravity = ToastGravity.TOP_LEFT,
      Color backColor = Colors.black,
      Color textColor = Colors.green}) {
    Widget toast = Container(
      margin: EdgeInsets.only(top: ScreenUtil.getInstance().getAdapterSize(10)),
      height: ScreenUtil.getInstance().getAdapterSize(50),
      width: ScreenUtil.getInstance().getAdapterSize(250),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: backColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: ScreenUtil.getInstance().getAdapterSize(10),
            color: colorStatus ? const Color(0xFF008D26) : Colors.red,
          ),
          SizedBox(
            width: ScreenUtil.getInstance().getAdapterSize(10),
          ),
          SvgPicture.asset(
            colorStatus
                ? 'assets/icon/svg/check_box_success.svg'
                : 'assets/icon/svg/check_box_fail.svg',
            width: 25,
            height: 25,
          ),
          SizedBox(
            width: ScreenUtil.getInstance().getAdapterSize(10),
          ),
          Text(content,
              style: TextStyle(
                  color: colorStatus ? const Color(0xFF008D26) : Colors.red,
                  fontSize: ScreenUtil.getInstance().getAdapterSize(14),
                  fontWeight: FontWeight.w500)),
        ],
      ),
    );

    _fToast.showToast(
      child: toast,
      gravity: gravity,
      toastDuration: Duration(seconds: 2),
    );
  }

  Widget getAppBarLeft() {
    return InkWell(
      onTap: clickAppBarBack,
      child: Icon(
        Icons.arrow_back,
        color: Colors.black,
      ),
    );
  }

  void clickAppBarBack() {
    finish();
  }

  void finish<T extends Object>([T? result]) {
    if (Navigator.canPop(_contextBaseFunction!)) {
      Navigator.pop<T>(_contextBaseFunction!, result);
    } else {
      finishDartPageOrApp();
    }
  }

  void finishDartPageOrApp() {
    SystemNavigator.pop();
  }

  void showToastMessage(String content,
      {Toast length = Toast.LENGTH_SHORT,
      ToastGravity gravity = ToastGravity.TOP,
      Color backColor = Colors.black54,
      Color textColor = Colors.white}) {
    Widget toast = Container(
      padding: EdgeInsets.symmetric(
          horizontal: ScreenUtil.getInstance().getAdapterSize(24),
          vertical: ScreenUtil.getInstance().getAdapterSize(10)),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0), color: backColor),
      child: Text(content,
          style: TextStyle(
              color: textColor,
              fontSize: ScreenUtil.getInstance().getAdapterSize(14))),
    );

    _fToast.showToast(
      child: toast,
      gravity: gravity,
      toastDuration: Duration(seconds: 2),
    );
  }
}
