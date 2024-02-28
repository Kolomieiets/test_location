import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationScreenProvider with ChangeNotifier {
  bool isConnected = false;
  bool isAllowed = false;
  bool isLoading = false;

  double lat = 0;
  double lon = 0;

  Future<void> checkConnection() async {
    isLoading = true;
    ConnectivityResult? connectivityResult;
    try {
      connectivityResult = await (Connectivity().checkConnectivity());
    } catch (error) {
      isConnected = false;
    }
    if (connectivityResult == null ||
        connectivityResult == ConnectivityResult.none) {
      isConnected = false;
    } else {
      isConnected = true;
    }

    notifyListeners();
  }

  Future<bool> isPermissionOk() async {
    PermissionStatus status = await Permission.location.status;
    if (status.isDenied) {
      try {
        await Permission.location.request();
        status = await Permission.location.status;
      } catch (error) {
        if (status.isDenied) {
          return false;
        }
      }
    }
    if (status.isGranted) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> getGeolocation() async {
    bool permitted = await isPermissionOk();
    if (!permitted) {
      isLoading = false;
      isAllowed = false;
    }

    if (permitted) {
      isAllowed = true;
      Position position = await Geolocator.getCurrentPosition();
      lat = position.latitude;
      lon = position.longitude;
      isLoading = false;
    }

    isLoading = false;
    notifyListeners();
  }
}
