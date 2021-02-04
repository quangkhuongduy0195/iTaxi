
import 'package:Taxi/src/resources/pages/home_page.dart';
import 'package:Taxi/src/resources/pages/register_page.dart';
import 'package:Taxi/src/resources/pages/ride_picker_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationHelper {
  static homePage(BuildContext context){
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
  }

  static registerPage(BuildContext context) async {
    return await Navigator.of(context).push(MaterialPageRoute(builder: (context) => RegisterPage()));
  }

  static pop(BuildContext context, Object params) {
    Navigator.pop(context, params);
  }

  static ridePickerPage(BuildContext context, bool isFromAddress, String selectedAddress) async {
    return await Navigator.of(context).push(MaterialPageRoute(builder: (context) => RidePickerPage(isFromAddress, selectedAddress)));
  }



}