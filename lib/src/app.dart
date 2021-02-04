import 'package:Taxi/src/firebase/fire_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class MyApp extends InheritedWidget {

  final FireAuth fireAuth;
  final Widget child;

  MyApp(this.fireAuth, this.child) : super(child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return false;
  }

  static MyApp of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyApp>();
  }
}