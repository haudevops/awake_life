import 'package:awake_life/base/base.dart';
import 'package:awake_life/model/model_export.dart';
import 'package:awake_life/page/page_export.dart';
import 'package:awake_life/utils/util_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MenuPage extends BasePage {
  MenuPage({Key? key}) : super(bloc: MenuBloc());
  static const routeName = '/MenuPage';

  @override
  BasePageState<BasePage<BaseBloc>> getState() => _MenuPageState();
}

class _MenuPageState extends BasePageState<MenuPage> {
  List<ItemSettingsModel> getItemsListOne() {
    return [
      ItemSettingsModel(
          id: Constants.ITEM_MENU_INFO, title: 'Info', image: ''),
      ItemSettingsModel(
          id: Constants.ITEM_MENU_EVENTS, title: 'Events', image: ''),
      ItemSettingsModel(
          id: Constants.ITEM_MENU_FRIENDS, title: 'Friends', image: ''),
      ItemSettingsModel(
          id: Constants.ITEM_MENU_ACTION, title: 'Actions', image: ''),
      ItemSettingsModel(
          id: Constants.ITEM_MENU_LOGOUT, title: 'Logout', image: ''),
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
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: ScreenUtil.getInstance().getAdapterSize(50),
              ),
              Text(
                'Setting',
                style: TextStyle(
                    fontSize: ScreenUtil.getInstance().getAdapterSize(25),
                    fontWeight: FontWeight.w600),
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
      color: Colors.black12,
      child: ListTile(
        // leading: Container(
        //   height: ScreenUtil.getInstance().getAdapterSize(35),
        //   width: ScreenUtil.getInstance().getAdapterSize(35),
        //   child: SvgPicture.asset(imageXML),
        // ),
        contentPadding: const EdgeInsets.only(left: 8, right: 5),
        title: Text(
          text,
          style: TextStyle(color: textColor),
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }

  void _onClickItem(String id) {
    switch (id) {
      case Constants.ITEM_MENU_INFO:
        DebugLog.show('Click ITEM_MENU_HISTORY');
        break;
      case Constants.ITEM_MENU_EVENTS:
        DebugLog.show('Click ITEM_MENU_STATISTICAL');
        break;
      case Constants.ITEM_MENU_FRIENDS:
        DebugLog.show('Click ITEM_MENU_WALLET');
        break;
      case Constants.ITEM_MENU_LOGOUT:
        DebugLog.show('Click ITEM_MENU_SHARE_CODE');
        break;
      default:
        break;
    }
  }
}
