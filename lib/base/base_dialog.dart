import 'package:awake_life/res/colors.dart';
import 'package:awake_life/utils/util_export.dart';
import 'package:flutter/material.dart';

class BaseDialog extends StatelessWidget {
  const BaseDialog({Key? key, required this.detailWidget, this.onClose})
      : super(key: key);
  final VoidCallback? onClose;
  final Widget detailWidget;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 0,
      backgroundColor: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: onClose,
              icon: Icon(Icons.close, color: AppColor.colorTextGray),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(
                  left: ScreenUtil.getInstance().getAdapterSize(16),
                  right: ScreenUtil.getInstance().getAdapterSize(16),
                  bottom: ScreenUtil.getInstance().getAdapterSize(16)),
              child: detailWidget),
        ],
      ),
    );
  }
}
