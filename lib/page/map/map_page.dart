import 'dart:async';

import 'package:awake_life/base/base.dart';
import 'package:awake_life/page/page_export.dart';
import 'package:awake_life/res/colors.dart';
import 'package:awake_life/utils/util_export.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends BasePage {
  MapPage({Key? key}) : super(bloc: MapBloc());
  static const routeName = '/MapPage';

  @override
  BasePageState<BasePage<BaseBloc>> getState() => _MapPageState();
}

class _MapPageState extends BasePageState<MapPage> {
  final Completer<GoogleMapController> _controller = Completer();
  late Set<Marker> markers = {};
  late MapBloc _bloc;

  double? _latitude;
  double? _longitude;

  @override
  void onCreate() {
    _bloc = getBloc();

    _bloc.locationStream.listen((position) async {
      _latitude = position.latitude;
      _longitude = position.longitude;

      setState(() {
        markers = {
          Marker(
            markerId: const MarkerId('LocationDriver'),
            position: LatLng(_latitude ?? 0, _longitude ?? 0),
            icon: BitmapDescriptor.defaultMarker,
          )
        };
      });
      final GoogleMapController controller = await _controller.future;
      controller.moveCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(position.latitude, position.longitude),
        zoom: 14,
      )));
    });
  }

  @override
  void onDestroy() {
    // TODO: implement onDestroy
  }

  @override
  Widget buildWidget(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: ScreenUtil.getInstance().screenHeight,
          width: ScreenUtil.getInstance().screenWidth,
          color: AppColor.colorWhiteDark,
          child: GoogleMap(
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            compassEnabled: true,
            zoomControlsEnabled: true,
            tiltGesturesEnabled: true,
            initialCameraPosition: CameraPosition(
              target: LatLng(_latitude ?? 0, _longitude ?? 0),
              zoom: 14,
            ),
            onMapCreated: onMapCreated,
            onTap: (LatLng location) {},
            // markers: markers,
          ),
        ),
      ),
    );
  }

  void onMapCreated(GoogleMapController controller) {
    controller.setMapStyle(MapStyle.mapStyles);
    _controller.complete(controller);
  }
}
