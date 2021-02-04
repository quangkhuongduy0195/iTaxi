import 'package:Taxi/src/models/place_item_res.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PlaceService {
  static Future<List<PlaceItemRes>> searchPlace(String keyWord) async {
    var decodeKeyWord = Uri.encodeQueryComponent(keyWord);
    debugPrint("decodeKeyWord: $decodeKeyWord");
    String url = "https://maps.googleapis.com/maps/api/place/textsearch/json?&language=vi&region=VN&key=AIzaSyDCGmWrUyarAz5iIUeOX3X8eI3S7Qvfo3g&query=$decodeKeyWord";
    debugPrint("url: $url");
    var res = await http.get(url);
    if(res.statusCode == 200){
      return PlaceItemRes.fromJson(json.decode(res.body));
    }
    return new List();
  }
}