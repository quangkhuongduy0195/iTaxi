import 'package:flutter/material.dart';

class HomeMenu extends StatefulWidget {
  @override
  _HomeMenuState createState() => _HomeMenuState();
}

class _HomeMenuState extends State<HomeMenu> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        SizedBox(
          width: double.infinity,
          height: 64,
        ),
        ListTile(
          leading: Image.asset("ic_user2.png"),
          title: Text(
            "My Profile",
            style: TextStyle(fontSize: 18, color: Color(0xff323643), fontFamily: "Montserrat"),
          ),
        ),
        ListTile(
          leading: Image.asset("ic_refresh.png"),
          title: Text(
            "Ride History",
            style: TextStyle(fontSize: 18, color: Color(0xff323643), fontFamily: "Montserrat"),
          ),
        ),
        ListTile(
          leading: Image.asset("ic_percent.png"),
          title: Text(
            "Offers",
            style: TextStyle(fontSize: 18, color: Color(0xff323643), fontFamily: "Montserrat"),
          ),
        ),
        ListTile(
          leading: Image.asset("ic_notification.png"),
          title: Text(
            "Notifications",
            style: TextStyle(fontSize: 18, color: Color(0xff323643), fontFamily: "Montserrat"),
          ),
        ),
        ListTile(
          leading: Image.asset("ic_help.png"),
          title: Text(
            "Help & Supports",
            style: TextStyle(fontSize: 18, color: Color(0xff323643), fontFamily: "Montserrat"),
          ),
        ),
        ListTile(
          leading: Image.asset("ic_logout.png"),
          title: Text(
            "Logout",
            style: TextStyle(fontSize: 18, color: Color(0xff323643), fontFamily: "Montserrat"),
          ),
        )
      ],
    );
  }
}