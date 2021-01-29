import 'dart:developer';

import 'package:Taxi/generated/l10n.dart';
import 'package:Taxi/src/blocs/register_bloc.dart';
import 'package:Taxi/src/models/login_info_model.dart';
import 'package:Taxi/src/resources/controls/text_field_border.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';


class RegisterPage extends StatefulWidget{
  @override
  _RegisterPageState createState() => _RegisterPageState();

}

class _RegisterPageState extends State<RegisterPage> {

  RegisterBloc _registerBloc;


  TextEditingController _nameController;
  TextEditingController _phoneController;
  TextEditingController _emailController;
  TextEditingController _passwordController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameController = new TextEditingController();
    _phoneController = new TextEditingController();
    _emailController = new TextEditingController();
    _passwordController = new TextEditingController();
    _registerBloc = new RegisterBloc();

    _nameController.text = "DuyQK";
    _phoneController.text = "0971627836";
    _emailController.text = "DuyQk@gmail.com";
    _passwordController.text = "DuyQK123123";

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _registerBloc.dispose();
    _registerBloc = null;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
     body: new GestureDetector(
       onTap: () {
         FocusScope.of(context).requestFocus(new FocusNode());
       },
       child: SafeArea(
         child: Container(
         color: Colors.white,
           constraints: BoxConstraints.expand(),
           child: SingleChildScrollView(
             padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
             child: Column(
               mainAxisAlignment: MainAxisAlignment.start,
               crossAxisAlignment: CrossAxisAlignment.center,
               children: [
                 SizedBox(
                   width: double.infinity,
                   height: 80,
                 ),
                 Image.asset("ic_car_red.png"),
                 Padding(padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                   child: Text(S.current.WelcomeAboard, style: TextStyle(fontSize: 28, color: Colors.black, fontFamily: "Montserrat"),),
                 ),
                 Padding(padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                   child: Text(S.current.SignUpWithITaxiInSimpleSteps, style: TextStyle(fontSize: 20, color: Color(0xff777777), fontFamily: "Montserrat"),),
                 ),
                 Padding(padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                   child: TextFieldBorder(
                     stream: _registerBloc.nameStream,
                     controller: _nameController,
                     icon: Image.asset("ic_user.png"),
                     placeholder: S.current.Name,
                   ),
                 ),
                 Padding(padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                   child: TextFieldBorder(
                     keyboardType: TextInputType.phone,
                     stream: _registerBloc.phoneStream,
                     controller: _phoneController,
                     icon: Image.asset("ic_phone.png"),
                     placeholder: S.current.PhoneNumber,
                   ),
                 ),
                 Padding(padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                   child: TextFieldBorder(
                     keyboardType: TextInputType.emailAddress,
                     stream: _registerBloc.emailStream,
                     controller: _emailController,
                     icon: Image.asset("ic_mail.png"),
                     placeholder: S.current.Email,
                   ),
                 ),
                 Padding(padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                   child: TextFieldBorder(
                     stream: _registerBloc.passwordStream,
                     controller: _passwordController,
                     icon: Image.asset("ic_lock.png"),
                     placeholder: S.current.Password,
                     isPassword: true,
                   ),
                 ),
                 Padding(padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                   child: SizedBox(
                     width: double.infinity,
                     height: 44,
                     child: RaisedButton(
                       shape: RoundedRectangleBorder(
                           borderRadius: BorderRadiusDirectional.circular(8)
                       ),
                       color: Colors.blue,
                       child: Text(S.current.SignUp, style: TextStyle(fontSize: 18, color: Colors.white, fontFamily: "Montserrat")),
                       onPressed: () {
                         signUpClicked(context);
                       },
                     ),
                   ),
                 ),
                 Padding(padding: const EdgeInsets.fromLTRB(0, 35, 0, 0),
                   child: RichText(
                     text: TextSpan(
                       text: S.current.AlreadyUser,
                       style: TextStyle(color: Color(0xff606470), fontSize: 16, fontFamily: "Montserrat"),
                       children: [
                         TextSpan(
                             text: S.current.LoginNow,
                             style: TextStyle(color: Color(0xff3277D8), fontSize: 16, fontFamily: "Montserrat"),
                             recognizer: TapGestureRecognizer() ..onTap = () {
                               goBack(context, null);
                             }
                         ),
                       ],
                     ),
                   ),
                 ),
               ],
             ),
           ),
         ),
       ),
     ),
    );
  }
  void signUpClicked(BuildContext context){
    var name = _nameController.text;
    var phone = _phoneController.text;
    var mail = _emailController.text;
    var password = _passwordController.text;
    if(_registerBloc.valid(name, phone, mail, password)){
      // showAlertDialog(context);
      _registerBloc.signUp(name, phone, mail, password, () {
        debugPrint("=====Sign Up Success");
        LoginInfoModel loginInfoModel = new LoginInfoModel(mail, password);
        goBack(context, loginInfoModel);
      }, () {
        // Navigator.pop(context);
      });
    }
  }

  void goBack(BuildContext context, LoginInfoModel loginInfoModel){
    Navigator.pop(context, loginInfoModel);
  }

  showAlertDialog(BuildContext context){
    AlertDialog alert=AlertDialog(
      content: new Row(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: CircularProgressIndicator()),
          Container(margin: EdgeInsets.only(left: 5),child:Text("Loading" )),
        ],),
      );
    showDialog(barrierDismissible: false,
      context:context,
      builder:(BuildContext context){
        return alert;
      },
    );
  }

}