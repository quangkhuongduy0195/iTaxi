import 'package:flutter/material.dart';

class TextFieldBorder extends StatefulWidget{
  final Image icon;
  final String placeholder;
  final bool isPassword;
  final TextEditingController controller;
  final Stream stream;
  final TextInputType keyboardType;

  TextFieldBorder({@required this.icon, @required this.placeholder, this.isPassword, this.controller, this.stream, this.keyboardType});

  @override
  _TextFieldBorderState createState() => _TextFieldBorderState();
}

class _TextFieldBorderState extends State<TextFieldBorder>{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      elevation: 2,
      shadowColor: Colors.black,
      borderRadius: BorderRadius.all(Radius.circular(8)),
      child: StreamBuilder(
        stream: widget.stream,
        builder: (context, snapShot) => TextField(
          keyboardType: widget.keyboardType,
          controller: widget.controller,
          obscureText: widget.isPassword ?? false,
          decoration: InputDecoration(
            errorText: snapShot.hasError ? snapShot.error : null,
            labelText: widget.placeholder,
            labelStyle: TextStyle(fontSize: 18, color: Colors.black, fontFamily: "Montserrat"),
            prefixIcon: Container(
              width: 50,
              child: widget.icon
            ),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffced0d2), width: 1),
                borderRadius: BorderRadius.all(Radius.circular(8))
            ),
          ),
        ),
      ),
    );
  }

}