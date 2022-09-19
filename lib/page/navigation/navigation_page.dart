import 'package:awake_life/base/base.dart';
import 'package:awake_life/page/page_export.dart';
import 'package:awake_life/routes/screen_arguments.dart';
import 'package:awake_life/utils/providers/theme_provider.dart';
import 'package:awake_life/widget/snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';

class NavigationPage extends BasePage {
  NavigationPage({Key? key, required this.data})
      : super(bloc: NavigationBloc());
  static const routeName = '/NavigationPage';
  final ScreenArguments data;

  @override
  BasePageState<BasePage<BaseBloc>> getState() => _NavigationPageState();
}

class _NavigationPageState extends BasePageState<NavigationPage> {
  late PageController _pageController;
  int? _selectedItemPosition;
  SnakeShape snakeShape = SnakeShape.circle;

  bool showSelectedLabels = false;
  bool showUnselectedLabels = false;

  Color selectedColor = Colors.black;
  Color unselectedColor = Colors.blueGrey;

  SnakeBarBehaviour snakeBarStyle = SnakeBarBehaviour.floating;
  EdgeInsets padding = const EdgeInsets.all(12);
  ShapeBorder? bottomBarShape = const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(25)),
  );

  final _location = Location();

  final BorderRadius _borderRadius = const BorderRadius.only(
    topLeft: Radius.circular(25),
    topRight: Radius.circular(25),
  );

  Color? containerColor;
  List<Color> containerColors = [
    const Color(0xFFFDE1D7),
    const Color(0xFFE4EDF5),
    const Color(0xFFE7EEED),
    const Color(0xFFF4E4CE),
  ];

  void _updateTabSelection(int index) {
    setState(() {
      _selectedItemPosition = index;
      _pageController.animateToPage(index,
          duration: const Duration(milliseconds: 10), curve: Curves.ease);
    });
  }

  void _pageChanged(int index) {
    setState(() {
      _selectedItemPosition = index;
    });
  }

  initRouteParams() {
    _selectedItemPosition = widget.data.arg1;
    _pageController = PageController(
      initialPage: _selectedItemPosition ?? 0,
      keepPage: true,
    );
  }

  @override
  void onCreate() {
    initRouteParams();
    _locationRequest();
  }

  @override
  void onDestroy() {
    _pageController.dispose();
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: _pageChanged,
        children: [
          MapPage(),
          SocialPage(),
          HomePage(),
          NotificationPage(),
          MenuPage(),
        ],
      ),
      bottomNavigationBar: SnakeNavigationBar.color(
        backgroundColor: Theme.of(context).cardTheme.color,
        // height: 80,
        behaviour: snakeBarStyle,
        snakeShape: snakeShape,
        // shape: bottomBarShape,
        // padding: padding,

        snakeViewColor: Theme.of(context).primaryColor,
        selectedItemColor:
            snakeShape == SnakeShape.indicator ? selectedColor : null,
        unselectedItemColor: unselectedColor,

        showUnselectedLabels: showUnselectedLabels,
        showSelectedLabels: showSelectedLabels,

        currentIndex: _selectedItemPosition ?? 2,
        onTap: _updateTabSelection,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'tickets'),
          BottomNavigationBarItem(icon: Icon(Icons.live_tv), label: 'live_tv'),
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'home'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'notification'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'setting')
        ],
        selectedLabelStyle: const TextStyle(fontSize: 14),
        unselectedLabelStyle: const TextStyle(fontSize: 10),
      ),
    );
  }

  Future<void> _locationRequest() async {
    bool _serviceEnabled = await _location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await _location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    PermissionStatus _permissionGranted = await _location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _location.requestPermission();
      if (_permissionGranted == PermissionStatus.granted) {
        _location.changeNotificationOptions(
            channelName: 'Kênh thông báo AWL',
            title: 'Vị trí được sử dụng để nhận thông tin mới',
            description: 'AWL đang sử dụng vị trí của bạn');
        _location.enableBackgroundMode(enable: true);
      } else {
        return;
      }
    }

    _location.changeSettings(accuracy: LocationAccuracy.high, interval: 150000);

    _location.onLocationChanged.listen((LocationData currentLocation) {});
  }

}
