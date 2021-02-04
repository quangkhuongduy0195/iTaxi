import 'dart:async';
import 'package:Taxi/src/resources/widgets/home_menu.dart';
import 'package:Taxi/src/resources/widgets/ride_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomePageState();
  }

}

class _HomePageState extends State<HomePage> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(10.800357, 106.638921),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: HomeMenu(),
      ),
      body:  new GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: SafeArea(
          child: Container(
            child: Stack(
              children: [
                GoogleMap(
                  initialCameraPosition: _kGooglePlex,
                  mapToolbarEnabled: false,
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  top: 0,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      AppBar(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        title: Text("iTaxi", style: TextStyle(color: Colors.black, fontSize: 20, fontFamily: "Montserrat", fontWeight: FontWeight.bold),),
                        leading: FlatButton(
                          onPressed: () {
                            _scaffoldKey.currentState.openDrawer();
                          },
                          child: Image.asset("ic_menu.png"),
                        ),
                        actions: [
                          Image.asset("ic_bell.png"),
                        ],
                      ),
                      Padding(padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                        child: Container(
                          child: RidePicker((placeItem, isFromAddress) {
                            var aaa = placeItem.name;
                            if(isFromAddress){
                              debugPrint("isFromAddress true: $isFromAddress - $aaa");
                            } else {
                              debugPrint("isFromAddress false: $isFromAddress - $aaa");
                            }
                          }),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}

class MapSampleState extends State<HomePage> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: Text('To the lake!'),
        icon: Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}