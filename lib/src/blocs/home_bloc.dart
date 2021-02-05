

import 'package:Taxi/src/config/configs.dart';
import 'package:Taxi/src/repository/place_service.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeBloc {
  PolylinePoints polylinePoints = PolylinePoints();
  Future<dynamic> getStep(LatLng from, LatLng to) async {
    List<LatLng> polylineCoordinates = [];
    var ff =  PointLatLng(from.latitude, from.longitude);
    var tt =  PointLatLng(to.latitude, to.longitude);
    PolylineResult result = await polylinePoints?.getRouteBetweenCoordinates(Configs.ggKEY, ff, tt);

    if(result.points.isNotEmpty){
      result.points.forEach((element) {
        polylineCoordinates.add(LatLng(element.latitude, element.longitude));
      });
    }
    return polylineCoordinates;
  }
}