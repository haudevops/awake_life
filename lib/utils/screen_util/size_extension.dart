import 'dart:math';

import 'package:flutter/material.dart';

import 'screen_util.dart';

extension SizeExtension on num {
  //[ScreenUtil.setWidth]
  double get w => ScreenUtils().setWidth(this);

  //[ScreenUtil.setHeight]
  double get h => ScreenUtils().setHeight(this);

  //[ScreenUtil.radius]
  double get r => ScreenUtils().radius(this);

  //[ScreenUtil.setSp]
  double get sp => ScreenUtils().setSp(this);

  //smart size :  it check your value - if it is bigger than your value it will set your value
  //for example, you have set 16.sm() , if for your screen 16.sp() is bigger than 16 , then it will set 16 not 16.sp()
  //I think that it is good for save size balance on big sizes of screen
  double get sm => min(toDouble(), sp);

  //Multiple of screen width
  double get sw => ScreenUtils().screenWidth * this;

  //Multiple of screen height
  double get sh => ScreenUtils().screenHeight * this;

  //[ScreenUtil.setHeight]
  Widget get verticalSpace => ScreenUtils().setVerticalSpacing(this);

  //[ScreenUtil.setVerticalSpacingFromWidth]
  Widget get verticalSpaceFromWidth =>
      ScreenUtils().setVerticalSpacingFromWidth(this);

  //[ScreenUtil.setWidth]
  Widget get horizontalSpace => ScreenUtils().setHorizontalSpacing(this);

  //[ScreenUtil.radius]
  Widget get horizontalSpaceRadius =>
      ScreenUtils().setHorizontalSpacingRadius(this);

  //[ScreenUtil.radius]
  Widget get verticalSpacingRadius =>
      ScreenUtils().setVerticalSpacingRadius(this);
}

extension EdgeInsetsExtension on EdgeInsets {
  // Creates adapt insets using r [SizeExtension].
  EdgeInsets get r => copyWith(
    top: top.r,
    bottom: bottom.r,
    right: right.r,
    left: left.r,
  );
}

extension BorderRaduisExtension on BorderRadius {
  // Creates adapt BorderRadius using r [SizeExtension].
  BorderRadius get r => copyWith(
    bottomLeft: bottomLeft.r,
    bottomRight: bottomLeft.r,
    topLeft: topLeft.r,
    topRight: topRight.r,
  );
}

extension RaduisExtension on Radius {
  // Creates adapt Radius using r [SizeExtension].
  Radius get r => this
    ..x.r
    ..y.r;
}

extension BoxConstraintsExtension on BoxConstraints {
  // Creates adapt BoxConstraints using r [SizeExtension].
  BoxConstraints get r => copyWith(
    maxHeight: maxHeight.r,
    maxWidth: maxWidth.r,
    minHeight: minHeight.r,
    minWidth: minWidth.r,
  );

  // Creates adapt BoxConstraints using h-w [SizeExtension].
  BoxConstraints get hw => copyWith(
    maxHeight: maxHeight.h,
    maxWidth: maxWidth.w,
    minHeight: minHeight.h,
    minWidth: minWidth.w,
  );
}