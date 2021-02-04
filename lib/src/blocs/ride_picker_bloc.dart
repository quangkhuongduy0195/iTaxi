
import 'dart:async';

import 'package:Taxi/src/repository/place_service.dart';
import 'package:flutter/material.dart';

class RidePickerBloc {

  var _placeController = new StreamController();
  Stream get placeStream => _placeController.stream;

  void searchPlace(String keyWord){
    debugPrint("keyWord: $keyWord");
    _placeController.sink.add("start");
    PlaceService.searchPlace(keyWord).then((result) {
      _placeController.sink.add(result);
    });
  }

  void dispose() {
    _placeController.close();
  }
}