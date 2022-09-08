import 'package:awake_life/base/base.dart';
import 'package:awake_life/generated/l10n.dart';
import 'package:awake_life/model/model_export.dart';
import 'package:awake_life/page/page_export.dart';
import 'package:awake_life/res/colors.dart';
import 'package:awake_life/utils/util_export.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenuPage extends BasePage {
  MenuPage({Key? key}) : super(bloc: MenuBloc());
  static const routeName = '/MenuPage';

  @override
  BasePageState<BasePage<BaseBloc>> getState() => _MenuPageState();
}

class _MenuPageState extends BasePageState<MenuPage> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  List<ItemSettingsModel> getItemsListOne() {
    return [
      ItemSettingsModel(id: Constants.ITEM_MENU_INFO, title: S.current.info_user, image: ''),
      ItemSettingsModel(
          id: Constants.ITEM_MENU_SETTING, title: S.current.setting, image: ''),
      ItemSettingsModel(
          id: Constants.ITEM_MENU_LOGOUT, title: S.current.logout, image: ''),
    ];
  }

  @override
  void onCreate() {
    // TODO: implement onCreate
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: ScreenUtil.getInstance().getAdapterSize(35),
              ),
              Text(
                S.current.function,
                style: TextStyle(
                    fontSize: ScreenUtil.getInstance().getAdapterSize(25),
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: ScreenUtil.getInstance().getAdapterSize(20),
              ),
              _itemCard(getItemsListOne()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _itemCard(List<ItemSettingsModel> items) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: items.length,
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return _itemFunctionWidget(
            text: items[index].title,
            imageXML: items[index].image,
            onTap: () {
              _onClickItem(items[index].id);
            });
      },
    );
  }

  Widget _itemFunctionWidget(
      {required String text,
      required String imageXML,
      required GestureTapCallback onTap,
      Color? textColor}) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 0,
      color: Theme.of(context).cardTheme.color,
      child: ListTile(
        // leading: Container(
        //   height: ScreenUtil.getInstance().getAdapterSize(35),
        //   width: ScreenUtil.getInstance().getAdapterSize(35),
        //   child: SvgPicture.asset(imageXML),
        // ),
        title: Text(
          text,
          style: TextStyle(color: textColor),
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }

  Future<void> _clearToken() async {
    final SharedPreferences prefs = await _prefs;
    prefs.clear();
    if (!mounted) return;
    Navigator.pushNamed(context, SplashPage.routeName);
  }

  void _onClickItem(String id) {
    switch (id) {
      case Constants.ITEM_MENU_INFO:
        DebugLog.show('Click ITEM_MENU_HISTORY');
        Navigator.pushNamed(context, InfoPage.routeName);
        break;
      case Constants.ITEM_MENU_SETTING:
        DebugLog.show('Click ITEM_MENU_SETTING');
        Navigator.pushNamed(context, SettingPage.routeName);
        break;
      case Constants.ITEM_MENU_LOGOUT:
        DebugLog.show('Click ITEM_MENU_SHARE_CODE');
        _clearToken();
        break;
      default:
        break;
    }
  }
}
