import 'package:Taxi/src/models/place_item_res.dart';
import 'package:Taxi/src/utilities/navigation_helper.dart';
import 'package:flutter/material.dart';

class RidePicker extends StatefulWidget {
  final Function(PlaceItemRes, bool) onSelected;
  // RidePicker(this.onSelected);

  RidePicker(this.onSelected);

  @override
  _RidePickerState createState() => _RidePickerState();
}

class _RidePickerState extends State<RidePicker> {
  PlaceItemRes fromAddress;
  PlaceItemRes toAddress;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Color(0x88999999),
              offset: Offset(0, 5),
              blurRadius: 5.0,
            ),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            // color: Colors.blue,
            width: double.infinity,
            height: 50,
            child: FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusDirectional.circular(10)
              ),
              onPressed: () async {
                var result = await NavigationHelper.ridePickerPage(context, true, fromAddress == null ? "" : fromAddress.name);
                if(result != null){
                  widget.onSelected(result, true);
                  setState(() {
                    fromAddress = result;
                  });
                }
              },
              child: SizedBox.expand(
                child: Stack(
                  alignment: AlignmentDirectional.centerStart,
                  children: [
                    SizedBox(
                      width: 40,
                      height: 50,
                      child: Center(
                          child: Image.asset("ic_pointer.png")
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      width: 40,
                      height: 50,
                      child: Center(
                          child: Image.asset("ic_close.png")
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
                      child: Text(fromAddress == null ? "From" : fromAddress.name,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Color(0xff323643), fontSize: 16, fontFamily: "Montserrat"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            // color: Colors.blue,
            width: double.infinity,
            height: 50,
            child: FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusDirectional.circular(10)
              ),
              onPressed: () async {
                var result = await NavigationHelper.ridePickerPage(context, false, toAddress == null ? "" : toAddress.name);
                if(result != null){
                  widget.onSelected(result, false);
                  setState(() {
                    toAddress = result;
                  });
                }
              },
              child: SizedBox.expand(
                child: Stack(
                  alignment: AlignmentDirectional.centerStart,
                  children: [
                    SizedBox(
                      width: 40,
                      height: 50,
                      child: Center(
                          child: Image.asset("ic_navigation.png")
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      width: 40,
                      height: 50,
                      child: Center(
                          child: Image.asset("ic_close.png")
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
                      child: Text(toAddress == null ? "To" : toAddress.name,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Color(0xff323643), fontSize: 16, fontFamily: "Montserrat"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )

        ],
      ),
    );
  }
}