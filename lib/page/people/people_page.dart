import 'dart:convert';
import 'dart:developer';

import 'package:awake_life/base/base.dart';
import 'package:awake_life/model/model_export.dart';
import 'package:awake_life/page/page_export.dart';
import 'package:awake_life/res/colors.dart';
import 'package:awake_life/utils/util_export.dart';
import 'package:flutter/material.dart';

class PeoplePage extends BasePage {
  PeoplePage({Key? key}) : super(bloc: PeopleBloc());

  @override
  BasePageState<BasePage<BaseBloc>> getState() => _PeoplePageState();
}

class _PeoplePageState extends BasePageState<PeoplePage> {
  String? _data;
  PeopleModel? _peopleModel;

  Future<void> _parseJson() async {
    _data = await DefaultAssetBundle.of(context)
        .loadString("assets/data/people.json");
    final jsonResult = jsonDecode(_data!);
    log('Data: $jsonResult');
    setState(() {
      _peopleModel = PeopleModel.fromJson(jsonResult);
    });
  }

  Future<void> _refresh() async {}

  @override
  void onCreate() {
    _parseJson();
  }

  @override
  void onDestroy() {
    // TODO: implement onDestroy
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      body: Container(
        height: ScreenUtil.getInstance().screenHeight,
        width: ScreenUtil.getInstance().screenWidth,
        padding: EdgeInsets.all(ScreenUtil.getInstance().getAdapterSize(16)),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: ScreenUtil.getInstance().getAdapterSize(35)),
              child: Text(
                'People',
                style: TextStyle(
                    fontSize: ScreenUtil.getInstance().getAdapterSize(25),
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: ScreenUtil.getInstance().getAdapterSize(20),
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: _refresh,
                child: ListView.builder(
                    itemCount: _peopleModel?.data?.length ?? 0,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.only(
                            left: ScreenUtil.getInstance().getAdapterSize(16),
                            right: ScreenUtil.getInstance().getAdapterSize(16),
                            bottom:
                            ScreenUtil.getInstance().getAdapterSize(10)),
                        child: GestureDetector(
                          onTap: () => {print('click row $index')},
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                    color: Colors.orange[100],
                                    borderRadius: BorderRadius.circular(10)),
                                child: IconButton(
                                  iconSize: 20,
                                  color: Colors.orange[300],
                                  onPressed: () => {},
                                  icon: const Icon(
                                    Icons.email_rounded,
                                    color: Colors.orange,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      _peopleModel?.data?[index].title ?? '',
                                      style: TextStyle(
                                          fontSize: ScreenUtil.getInstance()
                                              .getAdapterSize(16),
                                          color: Colors.black),
                                    ),
                                    SizedBox(
                                      height: ScreenUtil.getInstance()
                                          .getAdapterSize(5),
                                    ),
                                    Text(
                                      '${_peopleModel?.data?[index].name}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(
                                      height: ScreenUtil.getInstance()
                                          .getAdapterSize(3),
                                    ),
                                    Text(
                                      '${_peopleModel?.data?[index].day}',
                                      style: TextStyle(color: AppColor.colorText),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
