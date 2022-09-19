import 'dart:convert';
import 'dart:developer';

import 'package:awake_life/base/base.dart';
import 'package:awake_life/model/model_export.dart';
import 'package:awake_life/page/page_export.dart';
import 'package:awake_life/utils/screen_util.dart';
import 'package:awake_life/widget/snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomePage extends BasePage {
  HomePage({Key? key}) : super(bloc: HomeBloc());
  static const routeName = '/HomePage';

  @override
  BasePageState<BasePage<BaseBloc>> getState() => _HomePageState();
}

class _HomePageState extends BasePageState<HomePage> {
  String? _data;
  SocialModel? _socialModel;
  final ScrollController _sliverScrollController = ScrollController();
  bool isPinned = false;

  @override
  void onCreate() {
    _parseJson();
    _sliverScrollController.addListener(() {
      if (!isPinned &&
          _sliverScrollController.hasClients &&
          _sliverScrollController.offset > kToolbarHeight) {
        setState(() {
          isPinned = true;
        });
      } else if (isPinned &&
          _sliverScrollController.hasClients &&
          _sliverScrollController.offset < kToolbarHeight) {
        setState(() {
          isPinned = false;
        });
      }
    });
  }

  @override
  void onDestroy() {
    // TODO: implement onDestroy
  }

  Future<void> _parseJson() async {
    _data = await DefaultAssetBundle.of(context)
        .loadString("assets/data/social_data.json");
    final jsonResult = jsonDecode(_data!);
    log('Data: $jsonResult');
    setState(() {
      _socialModel = SocialModel.fromJson(jsonResult);
    });
  }

  final Shader linearGradient = LinearGradient(
    colors: <Color>[Colors.blueAccent.shade400, Colors.greenAccent.shade200],
  ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  Future<void> _refresh() async {}

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: CustomScrollView(
          shrinkWrap: true,
          controller: _sliverScrollController,
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              expandedHeight: ScreenUtil.getInstance().getAdapterSize(200),
              stretch: true,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.only(
                    bottom: ScreenUtil.getInstance().getAdapterSize(13)),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "AWL",
                      style: TextStyle(
                          fontSize: ScreenUtil.getInstance().getAdapterSize(20),
                          color: !isPinned ? Colors.white : Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                centerTitle: true,
                stretchModes: const [
                  StretchMode.zoomBackground,
                  StretchMode.blurBackground,
                  StretchMode.fadeTitle,
                ],
                background: Image.asset(
                  'assets/img/appbar_background.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                  childCount: _socialModel?.data?.length, (context, index) {
                return Card(
                  elevation: 2,
                  color: Theme.of(context).cardColor,
                  child: InkWell(
                    onDoubleTap: () {},
                    onTap: () {
                      print(
                          'OnClick: ${_socialModel?.data?[index].nameProduct}');
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(
                          horizontal:
                              ScreenUtil.getInstance().getAdapterSize(8),
                          vertical: ScreenUtil.getInstance().getAdapterSize(8)),
                      width: ScreenUtil.getInstance().screenWidth,
                      child: Column(
                        children: [
                          SizedBox(
                            height:
                                ScreenUtil.getInstance().getAdapterSize(180),
                            width: ScreenUtil.getInstance().screenWidth,
                            child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl: '${_socialModel?.data?[index].image}',
                              placeholder: (context, url) => SizedBox(
                                width: 30,
                                height: 30,
                                child: Lottie.asset(
                                    'assets/img/loading_lottie.json',
                                    fit: BoxFit.scaleDown),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
