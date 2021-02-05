import 'package:Taxi/src/config/configs.dart';
import 'package:Taxi/src/models/place_item_res.dart';
import 'package:Taxi/src/models/steps_res.dart';
import 'package:Taxi/src/models/trip_info_res.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PlaceService {
  static Future<List<PlaceItemRes>> searchPlace(String keyWord) async {
    var decodeKeyWord = Uri.encodeQueryComponent(keyWord);
    debugPrint("decodeKeyWord: $decodeKeyWord");
    String url = "https://maps.googleapis.com/maps/api/place/textsearch/json?&language=vi&region=VN&key=AIzaSyDCGmWrUyarAz5iIUeOX3X8eI3S7Qvfo3g&query=$decodeKeyWord";
    // debugPrint("url: $url");
    var res = await http.get(url);
    if(res.statusCode == 200){
      return PlaceItemRes.fromJson(json.decode(res.body));
    }
    return new List();
  }

  static Future<dynamic> getStep(LatLng from, LatLng to) async {
    String strOrigin = "origin=" + from.latitude.toString() + "," + from.longitude.toString();
    String strDest = "destination=" + to.latitude.toString() + "," + to.longitude.toString();
    String sensor = "sensor=false";
    String mode = "mode=driving";
    String parameters = strOrigin + "&" + strDest + "&" + sensor + "&" + mode;
    String output = "json";
    // https://maps.googleapis.com/maps/api/directions/json?origin=sydney,au&destination=perth,au&waypoints=via:-37.81223%2C144.96254%7Cvia:-34.92788%2C138.60008&key=AIzaSyDCGmWrUyarAz5iIUeOX3X8eI3S7Qvfo3g
    // String url = "https://maps.googleapis.com/maps/api/directions/" +
    //     output +
    //     "?" +
    //     parameters +
    //     "&key=" +
    //     Configs.ggKEY;

    String url = "https://maps.googleapis.com/maps/api/directions/json?origin=sydney,au&destination=perth,au&waypoints=via:" +
        from.latitude.toString()+"%2C"+from.longitude.toString()+"%7Cvia:"+ to.latitude.toString() + "%2C" + to.longitude.toString()+
        "&key=" + Configs.ggKEY;
    debugPrint(url);
    final JsonDecoder _decoder = new JsonDecoder();
    return http.get(url).then((http.Response response) {
      String res = response.body;
      int statusCode = response.statusCode;
//      print("API Response: " + res);
      if (statusCode < 200 || statusCode > 400 || json == null) {
        res = "{\"status\":" +
            statusCode.toString() +
            ",\"message\":\"error\",\"response\":" +
            res +
            "}";
        throw new Exception(res);
      }


      TripInfoRes tripInfoRes;
      try {
        var mjson = json.decode(res);
        int distance = mjson["routes"][0]["legs"][0]["distance"]["value"];
        List<StepsRes> steps =
        _parseSteps(mjson["routes"][0]["legs"][0]["steps"]);

        tripInfoRes = new TripInfoRes(distance, steps);

      } catch (e) {
        throw new Exception(res);
      }

      return tripInfoRes;
    });
  }

  static List<StepsRes> _parseSteps(final responseBody) {
    // debugPrint(responseBody);
    var list = responseBody
        .map<StepsRes>((json) => new StepsRes.fromJson(json))
        .toList();

    return list;
  }

}