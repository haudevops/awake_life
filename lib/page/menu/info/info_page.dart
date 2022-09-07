import 'dart:convert';
import 'dart:developer';

import 'package:awake_life/base/base.dart';
import 'package:awake_life/generated/l10n.dart';
import 'package:awake_life/model/model_export.dart';
import 'package:awake_life/page/page_export.dart';
import 'package:awake_life/res/colors.dart';
import 'package:awake_life/utils/util_export.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class InfoPage extends BasePage {
  InfoPage({Key? key}) : super(bloc: InfoBloc());
  static const routeName = '/InfoPage';

  @override
  BasePageState<BasePage<BaseBloc>> getState() => _InfoPageState();
}

class _InfoPageState extends BasePageState<InfoPage> {
  String? _data;
  UserInfo? _userInfo;

  @override
  void onCreate() {
    _parseJson();
  }

  @override
  void onDestroy() {
    // TODO: implement onDestroy
  }

  Future<void> _parseJson() async {
    _data = await DefaultAssetBundle.of(context)
        .loadString("assets/data/user_info_data.json");
    final jsonResult = jsonDecode(_data!);
    log('Data: $jsonResult');
    setState(() {
      _userInfo = UserInfo.fromJson(jsonResult);
    });
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.current.info_user,
          style: TextStyle(
            color: AppColor.colorWhiteDark,
            fontSize: ScreenUtil.getInstance().getAdapterSize(18),
            fontWeight: FontWeight.w600,
          ),
        ),
        elevation: 1,
        iconTheme: IconThemeData(color: AppColor.colorWhiteDark),
        backgroundColor: AppColor.colorAppBarDark,
        centerTitle: true,
      ),
      body: Container(
        color: AppColor.colorContainerDark,
        width: ScreenUtil.getInstance().screenWidth,
        height: ScreenUtil.getInstance().screenHeight,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: ScreenUtil.getInstance().getAdapterSize(10),
              ),
              _imageInfoUser(),
              SizedBox(
                height: ScreenUtil.getInstance().getAdapterSize(10),
              ),
              _itemInfoWidget(
                  text: _userInfo?.name ?? '',
                  iconData: Icons.person,
                  onTap: () {}),
              _itemInfoWidget(
                  text: _userInfo?.email ?? '',
                  iconData: Icons.email,
                  onTap: () {}),
              _itemInfoWidget(
                  text: _userInfo?.dayOfBirth ?? '',
                  iconData: Icons.calendar_month,
                  onTap: () {}),
              _itemInfoWidget(
                  text: _userInfo?.phone ?? '',
                  iconData: Icons.phone,
                  onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }

  Widget _imageInfoUser() {
    return Padding(
      padding: EdgeInsets.all(ScreenUtil.getInstance().getAdapterSize(15)),
      child: CachedNetworkImage(
        height: ScreenUtil.getInstance().getAdapterSize(90),
        width: ScreenUtil.getInstance().getAdapterSize(90),
        imageUrl: '${_userInfo?.imgAvatar}',
        imageBuilder: (context, image) => CircleAvatar(
          backgroundImage: image,
          radius: 150,
        ),
        placeholder: (context, url) => CircularProgressIndicator(),
        errorWidget: (context, url, error) =>
            Image.asset('assets/img/user.jpeg'),
      ),
    );
  }

  Widget _itemInfoWidget(
      {required String text,
      required IconData iconData,
      required GestureTapCallback onTap}) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 0,
      color: Colors.black12,
      margin: EdgeInsets.symmetric(
          horizontal: ScreenUtil.getInstance().getAdapterSize(15),
          vertical: ScreenUtil.getInstance().getAdapterSize(8)),
      child: ListTile(
        leading: SizedBox(
          height: ScreenUtil.getInstance().getAdapterSize(35),
          width: ScreenUtil.getInstance().getAdapterSize(35),
          child: Icon(
            iconData,
            size: ScreenUtil.getInstance().getAdapterSize(25),
          ),
        ),
        title: Text(
          text,
          style: TextStyle(color: AppColor.colorWhiteDark),
        ),
        onTap: onTap,
      ),
    );
  }
}
