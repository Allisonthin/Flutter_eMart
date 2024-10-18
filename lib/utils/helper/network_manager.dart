import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../popups/loader.dart';

class NetworkManager extends GetxController {
  static NetworkManager get instance => Get.find();

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  final Rx<ConnectivityResult> _connectivityStatus = ConnectivityResult.none.obs;


  /// initialize the manager and setup stream a   continually check the connectivity status

  @override
  void onInit() {
    super.onInit();
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  /// update the connection Status based on change in connectivity and show a relevant popup for no internet connection
  Future<void> _updateConnectionStatus(ConnectivityResult result) async{
    _connectivityStatus.value = result;
    if (_connectivityStatus.value == ConnectivityResult.none){
        TLoader.warningSnackBar(title: "no internet connection");
    }
  }

  /// check the Internet connection status
  /// Return true if connected, false otherwise
  Future<bool> isConnected() async{
    try{
      final result = await _connectivity.checkConnectivity();
      if(result == ConnectivityResult.none){
        return false;
      }
      else{
        return true;
      }
    } on PlatformException catch(e){
      return false;
    }
  }

  /// Dispose or close the active connectivity stream
  @override
  void onClose(){
    super.onClose();

    _connectivitySubscription.cancel();
  }





}