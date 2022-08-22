import 'package:awake_life/res/colors.dart';
import 'package:flutter/material.dart';

class Constants {
  Constants._();

  static const String loadingLottie = 'assets/images/delivery_lottie.json';

  static const String marvelHeroDetectionName = 'Tìm tên siêu anh hùng';
  static const String marvelHeroDetectionId = 'marvel_detection';

  static const int imageQuality = 90;
  static const double maxHeight = 1280;
  static const double maxWidth = 720 ;

  static const LOGIN_USERNAME = 'loginUserName';
  static const LOGIN_PASSWORD = 'loginPassword';

  static const LOGIN_TOKEN = 'loginToken';

  static const LANGUAGE_CHANGE = 'languageChange';

  static const THEME_APP = 'themeApp';

  static const BASE_URL = "BASE_URL";
  static const WS_URL = "WS_URL";
  static const CLOUD_URL = "CLOUD_URL";
  static const EFT_URL = "EFT_URL";
  static const CLOUD_KEY = "CLOUD_KEY";
  static const ENVIRONMENT = "ENVIRONMENT";

  static const DEV_ENVIRONMENT = "DEV";
  static const PROD_ENVIRONMENT = "PROD";

  static const ERROR_CODE = -1;
  static const MESSAGE_SUCCESS = 'Ok!';

  static const int MAX_GROUP = 500;

  //Define Language
  static const VIETNAMESE = 'vi';
  static const ENGLISH = 'en';

  static const LIMIT = 20;
  static const int UPDATE_INTERVAL_IN_MILLISECONDS = 15000;
  static const double DEFAULT_POINT_LAT = 10.770993;
  static const double DEFAULT_POINT_LNG = 106.705614;

  static final deliveryType = <String, Color>{
    'D2H': AppColor.orderStatusRed,
    'D3H': AppColor.orderStatusRed,
    'D4H': AppColor.orderStatusRed,
    'EXP': AppColor.orderStatusGreen,
    'STD': AppColor.colorPrimaryButton,
    'SMD': AppColor.colorPrimaryButton,
  };

  // static final orderStatusColor = <int, Color>{
  //   OrderStatus.TIME_OUT: AppColor.orderStatusRed,
  //   OrderStatus.PROCESSING: AppColor.orderStatusBlue,
  //   OrderStatus.NEW: AppColor.orderStatusGray,
  //   OrderStatus.FINDING: AppColor.orderStatusGray,
  //   OrderStatus.ACCEPTED: const Color(0xFFE7FFE3),
  //   OrderStatus.CANCELED_USER: AppColor.orderStatusRed,
  //   OrderStatus.CANCELED_PARTNER: AppColor.orderStatusRed,
  //   OrderStatus.CANCELED_ADMIN: AppColor.orderStatusRed,
  //   OrderStatus.IN_PROGRESS: const Color(0xFFDFEEFB),
  //   OrderStatus.FINISHED: const Color(0xFFFFF5EC),
  //   OrderStatus.RETURNING: const Color(0xFFFAD7D7),
  //   OrderStatus.INCIDENT: AppColor.orderStatusRed,
  //   OrderStatus.IN_PROGRESS_INCIDENT: AppColor.orderStatusGreen,
  //   OrderStatus.WAITING_CONFIRM: AppColor.orderStatusGray,
  //   OrderStatus.INSTALL_FAILED: AppColor.orderStatusRed,
  //   OrderStatus.PENDING: const Color(0xFFE4C9B4),
  //   OrderStatus.FINISHED_RETURNED: const Color(0xFFFAD7D7)
  // };
  //
  // static final orderTextStatusColor = <int, Color>{
  //   OrderStatus.TIME_OUT: AppColor.orderStatusRed,
  //   OrderStatus.PROCESSING: AppColor.orderStatusBlue,
  //   OrderStatus.NEW: AppColor.orderStatusGray,
  //   OrderStatus.FINDING: AppColor.orderStatusGray,
  //   OrderStatus.ACCEPTED: const Color(0xFF207513),
  //   OrderStatus.CANCELED_USER: Colors.white,
  //   OrderStatus.CANCELED_PARTNER: Colors.white,
  //   OrderStatus.CANCELED_ADMIN: AppColor.orderStatusRed,
  //   OrderStatus.IN_PROGRESS: const Color(0xFF115EA1),
  //   OrderStatus.FINISHED: const Color(0xFFF28022),
  //   OrderStatus.RETURNING: const Color(0xFFE30000),
  //   OrderStatus.INCIDENT: AppColor.orderStatusRed,
  //   OrderStatus.IN_PROGRESS_INCIDENT: AppColor.orderStatusGreen,
  //   OrderStatus.WAITING_CONFIRM: AppColor.orderStatusGray,
  //   OrderStatus.INSTALL_FAILED: AppColor.orderStatusRed,
  //   OrderStatus.PENDING: const Color(0xFF5E2B03),
  //   OrderStatus.FINISHED_RETURNED: const Color(0xFFE30000),
  // };
  //
  // static final orderStatus = <int, String>{
  //   OrderStatus.TIME_OUT: S.current.order_status_timeout,
  //   OrderStatus.PROCESSING: S.current.processing,
  //   OrderStatus.NEW: S.current.order_status_new,
  //   OrderStatus.FINDING: S.current.order_status_finding,
  //   OrderStatus.ACCEPTED: S.current.order_status_accepted,
  //   OrderStatus.CANCELED_USER: S.current.order_status_canceled_user,
  //   OrderStatus.CANCELED_PARTNER: S.current.order_status_canceled_partner,
  //   OrderStatus.CANCELED_ADMIN: S.current.order_status_canceled_admin,
  //   OrderStatus.IN_PROGRESS: S.current.order_status_in_progress,
  //   OrderStatus.FINISHED: S.current.order_status_finished,
  //   OrderStatus.RETURNING: S.current.order_status_returning,
  //   OrderStatus.INCIDENT: S.current.order_status_incident,
  //   OrderStatus.IN_PROGRESS_INCIDENT: S.current.order_status_in_incident,
  //   OrderStatus.WAITING_CONFIRM: S.current.order_status_waiting_confirm,
  //   OrderStatus.INSTALL_FAILED: S.current.order_status_install_fail,
  //   OrderStatus.PENDING: S.current.order_status_pending,
  //   OrderStatus.FINISHED_RETURNED: S.current.order_status_finished_returned,
  // };

  static const String ITEM_MENU_HISTORY = 'ITEM_MENU_HISTORY';
  static const String ITEM_MENU_STATISTICAL = 'ITEM_MENU_STATISTICAL';
  static const String ITEM_MENU_WALLET = 'ITEM_MENU_WALLET';
  static const String ITEM_MENU_SHARE_CODE = 'ITEM_MENU_SHARE_CODE';
  static const String ITEM_MENU_NEWS = 'ITEM_MENU_NEWS';
  static const String ITEM_MENU_TERMS_POLICY = 'ITEM_MENU_TERMS_POLICY';
  static const String ITEM_MENU_HELP = 'ITEM_MENU_HELP';
  static const String ITEM_MENU_SETTING = 'ITEM_MENU_SETTING';

  static const String ITEM_SUPPORT_HOTLINE = 'ITEM_SUPPORT_HOTLINE';
  static const String ITEM_SUPPORT_FACEBOOK = 'ITEM_SUPPORT_FACEBOOK';
  static const String ITEM_SUPPORT_WEBSITE = 'ITEM_SUPPORT_WEBSITE';
  static const String ITEM_SUPPORT_MAIL = 'ITEM_SUPPORT_MAIL';

}