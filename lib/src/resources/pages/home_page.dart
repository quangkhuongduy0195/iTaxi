import 'dart:async';
import 'package:Taxi/src/blocs/home_bloc.dart';
import 'package:Taxi/src/config/configs.dart';
import 'package:Taxi/src/models/place_item_res.dart';
import 'package:Taxi/src/models/steps_res.dart';
import 'package:Taxi/src/models/trip_info_res.dart';
import 'package:Taxi/src/resources/widgets/home_menu.dart';
import 'package:Taxi/src/resources/widgets/ride_picker.dart';
import 'package:Taxi/src/utilities/Utils.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomePageState();
  }

}

class _HomePageState extends State<HomePage> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final Map<String, Marker> _markers = new Map<String, Marker>();
  GoogleMapController _mapController;
  static const String _idFrom = "idFrom";
  static const String _idTo = "idTo";
  HomeBloc _homeBloc;
  final Set<Polyline> _polyline = {};

  BitmapDescriptor iconFrom;
  BitmapDescriptor iconTo;

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(10.800357, 106.638921),
    zoom: 14.4746,
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _homeBloc = new HomeBloc();
    setSourceAndDestinationIcons();
  }

  setSourceAndDestinationIcons() async {
    iconFrom = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5), 'assets/3.0x/ic_pointer.png');
    iconTo = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5),
        'assets/2.0x/ic_navigation.png');
  }

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
                  myLocationEnabled: true,
                  tiltGesturesEnabled: false,
                  onMapCreated: (GoogleMapController controller) {
                    _mapController = controller;
                    controller.setMapStyle(Utils.mapStyles);
                  },
                  markers: Set<Marker>.of(_markers.values),
                  polylines: _polyline,

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
                              _onPlaceSeleced(_idFrom, placeItem);
                            } else {
                              debugPrint("isFromAddress false: $isFromAddress - $aaa");
                              _onPlaceSeleced(_idTo, placeItem);
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

  _onPlaceSeleced(String id, PlaceItemRes place){
    _addMarker(id, place);
    _moveCamera();
    _checkDrawPolyline();
  }

  _addMarker(String id, PlaceItemRes place){
    _markers.remove(id);
    setState(() {
      _markers[id] = Marker(markerId: MarkerId(id),
                            position: LatLng(place.lat, place.lng),
                            infoWindow: InfoWindow(title: place.name, snippet: place.address),
                            icon: id == _idFrom ? iconFrom : iconTo,
                            anchor: Offset(0.5, 1.0), onTap: () {
        _mapController.showMarkerInfoWindow( MarkerId(id));
      });
    });
  }
  _moveCamera(){
    if(_markers.values.length > 1){
      var fromLatLng = _markers[_idFrom].position;
      var toLatLng = _markers[_idTo].position;

      LatLng s, n;
      if(fromLatLng.latitude <= toLatLng.latitude){
        s = fromLatLng;
        n = toLatLng;
      } else {
        n = fromLatLng;
        s = toLatLng;
      }
      LatLngBounds bounds = LatLngBounds(southwest: s, northeast: n);
      _mapController.moveCamera(CameraUpdate.newLatLngBounds(bounds, 50));
    } else {
      _mapController.moveCamera(CameraUpdate.newLatLng(_markers.values.elementAt(0).position));
    }
  }
  _checkDrawPolyline() async {
    if(_markers.values.length > 1) {
      var from = _markers[_idFrom].position;
      var to = _markers[_idTo].position;
      _homeBloc.getStep(from, to).then((value) {
        List<LatLng> polylineCoordinates = value;
        setState(() {
          Polyline polyline = Polyline(polylineId: PolylineId("poly"),  color: Color.fromARGB(255, 40, 122, 198), points: polylineCoordinates, width: 5);
          _polyline.add(polyline);
        });
      });
    }
  }
}