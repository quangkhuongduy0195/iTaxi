import 'package:flutter/material.dart';

class Loading {
  static Future<void> show(BuildContext context, GlobalKey key) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return new WillPopScope(
            onWillPop: () async => false,
            child: SimpleDialog(
                key: key,
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                children: <Widget>[
                  Center(
                    child: Column(children: [
                      CircularProgressIndicator(),
                      SizedBox(height: 10,),
                      Text("Please Wait....",style: TextStyle(color: Colors.blueAccent),)
                    ]),
                  )
                ]));
      });
  }

  static void hide(BuildContext context) {
     Navigator.of(context).pop();
  }
}