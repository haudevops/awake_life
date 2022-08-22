import 'dart:ui';

import 'package:awake_life/utils/util_export.dart';
import 'package:flutter/material.dart';

// @Auth: hau.tran
// @Description: Dialog Page
// @Date: 30/12/2021

class DialogPage extends StatelessWidget {
  const DialogPage({Key? key,
    required this.leading,
    required this.title,
    required this.onPressed,
    required this.textButton
  }) : super(key: key);

  final String leading;
  final String title;
  final VoidCallback? onPressed;
  final String textButton;

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        child: _bodyWidget(context),
      ),
    );
  }

  Widget _bodyWidget(BuildContext context){
    return Container(
      height: ScreenUtil.getInstance().getAdapterSize(200),
      width: ScreenUtil.getInstance().screenWidth,
      child: Stack(
        children: [
          Positioned(
            top: 50,
            left: 10,
            right: 10,
            child: Text(
              leading,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: ScreenUtil().getAdapterSize(18), color: Colors.black),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: ScreenUtil().getAdapterSize(16), color: Colors.black26),
            ),
          ),
          Positioned(
            bottom: 5,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: ScreenUtil.getInstance().getAdapterSize(10),
                  left: ScreenUtil.getInstance().getAdapterSize(50),
                  right: ScreenUtil.getInstance().getAdapterSize(50)),
              child: Container(
                width: ScreenUtil.getInstance().getAdapterSize(150),
                height: ScreenUtil.getInstance().getAdapterSize(40),
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                margin: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                child: ElevatedButton(
                  child: Text(
                    textButton,
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: onPressed,
                  style: ElevatedButton.styleFrom(
                      primary: Colors.orange,
                      textStyle:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.grey,),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
