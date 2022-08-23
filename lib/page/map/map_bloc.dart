import 'package:awake_life/base/base.dart';
import 'package:awake_life/utils/util_export.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rxdart/rxdart.dart';

class MapBloc extends BaseBloc{
  final _locationController = BehaviorSubject<Position>();

  Stream<Position> get locationStream => _locationController.stream;

  @override
  void dispose() {
    _locationController.close();
  }

  @override
  void onCreate(BuildContext context) {
    _getUserLocation();
  }

  Future<void> _getUserLocation() async {
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((position) {
      _locationController.sink.add(position);
    }).catchError((error) {
      DebugLog.show(error.toString());
    });
  }

}