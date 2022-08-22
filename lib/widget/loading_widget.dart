import 'package:awake_life/utils/util_export.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Widget getLoadingWidget() {
  return Center(
    child: SizedBox(
      width: 120,
      height: 120,
      child: Lottie.asset('assets/img/loading_lottie.json', fit: BoxFit.fill),
    ),
  );
}
