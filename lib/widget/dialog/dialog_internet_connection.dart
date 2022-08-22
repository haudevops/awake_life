
import 'package:awake_life/res/colors.dart';
import 'package:awake_life/utils/util_export.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogInternetConnect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 0,
      backgroundColor: Colors.white,
      child: _bodyWidget(context),
    );
  }

  Widget _bodyWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset('assets/images/img_no_network_connection.png'),
        const SizedBox(height: 10),
        Text(
          'Supra không nhận được phản hồi từ bạn !Hãy kiểm tra kết nối mạng',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: ScreenUtil().getAdapterSize(16), color: Colors.black26),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: AppColor.colorPrimary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onPressed: () {
              OpenSettings.openWIFISettings();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Đến cài đặt'.toUpperCase(),
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        )
      ],
    );
  }
}
