import 'package:Taxi/generated/l10n.dart';
import 'package:Taxi/src/blocs/ride_picker_bloc.dart';
import 'package:Taxi/src/models/place_item_res.dart';
import 'package:Taxi/src/utilities/navigation_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RidePickerPage extends StatefulWidget {

  final bool isFromAddress;
  final String selectedAddress;

  RidePickerPage(this.isFromAddress, this.selectedAddress);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _RidePickerPageState();
  }
}

class _RidePickerPageState extends State<RidePickerPage>{

  TextEditingController _searchController;
  RidePickerBloc _ridePickerBloc = new RidePickerBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _searchController = new TextEditingController();
    _searchController.text = widget.selectedAddress;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Bạn muốn đến đâu?", style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: "Montserrat", fontWeight: FontWeight.w500),),),
        body:  new GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: SafeArea(
            child: Container(
              constraints: BoxConstraints.expand(),
              child: Column(
                children: [
                  Flexible(
                    child: Container(
                      height: 50,
                      child: Stack(
                        alignment: AlignmentDirectional.centerStart,
                        children: [
                          SizedBox(
                            width: 50,
                            height: 50,
                            child: Image.asset("ic_pointer.png"),
                          ),
                          Positioned(
                              right: 0,
                              top: 0,
                              width: 50,
                              height: 50,
                              child: GestureDetector(child: Image.asset("ic_close.png"), onTap: () {
                                setState(() {
                                  _searchController.text = "";
                                });
                              },)
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 50, right: 50),
                            child: TextField(
                              controller: _searchController,
                              style: TextStyle(fontSize: 18, color: Colors.black, fontFamily: "Montserrat"),
                              autofocus: true,
                              textInputAction: TextInputAction.search,
                              onChanged: (str){
                                _ridePickerBloc.searchPlace(str);
                              },
                              onSubmitted: (keyWord) {
                                _ridePickerBloc.searchPlace(keyWord);
                              },
                              decoration: InputDecoration(
                                  hintText: S.current.EnterTheLocationHere,
                                  hintStyle: TextStyle(color: Color(0xff323643), fontSize: 16, fontFamily: "Montserrat")
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 8,
                    child: Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Container(
                        child: StreamBuilder(
                          stream: _ridePickerBloc.placeStream,
                          builder: (context, snapShot) {
                            if(snapShot.hasData) {
                              if(snapShot.data == "start"){
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              List<PlaceItemRes> places = snapShot.data;
                              return ListView.separated(
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      title: Text(places.elementAt(index).name),
                                      subtitle: Text(places.elementAt(index).address),
                                      onTap: () {
                                        debugPrint("tap index : $index");
                                        var params = places.elementAt(index);
                                        NavigationHelper.pop(context, params);
                                      },
                                    );
                                  },
                                  separatorBuilder: (context, index) => Divider(
                                    height: 1,
                                    color: Colors.grey,
                                  ),
                                  itemCount: places.length);
                            } else {
                              return Container();
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }

}