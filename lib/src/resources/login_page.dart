import 'package:Taxi/generated/l10n.dart';
import 'package:Taxi/src/resources/register_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'controls/text_field_border.dart';

class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
            padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(width: double.infinity, height: 100,),
                  Image.asset("ic_car_green.png"),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(0, 28, 0, 0),
                      child: Text(S.current.WelcomeBack, style: TextStyle(fontSize: 28, color: Colors.black, fontFamily: "Montserrat"),)
                  ),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                      child: Text(S.current.LoginToContinueUsingITaxi, style: TextStyle(fontSize: 20, color: Color(0xff777777), fontFamily: "Montserrat"),)
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
                    child: TextFieldBorder(
                      icon: Image.asset("ic_mail.png"),
                      placeholder: S.current.Email,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 22, 0, 0),
                    child: TextFieldBorder(
                      isPassword: true,
                      icon: Image.asset("ic_lock.png"),
                      placeholder: S.current.Password,
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(0, 22, 0, 0),
                      child: Container(
                        alignment: AlignmentDirectional.centerEnd,
                        child: Text(S.current.ForgotPassword, style:  TextStyle(fontSize: 14, color: Color(0xff888888), fontFamily: "Montserrat"),),
                      ),
                  ),
                  Padding(padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 44,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        color: Colors.blue,
                        onPressed: () {
                          Login_Clicked();
                        },
                        child: Text(S.current.Login, style: TextStyle(fontSize: 18, color: Colors.white, fontFamily: "Montserrat"),),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                    child: RichText(
                      text: TextSpan(
                        text: S.current.NewUser,
                        style: TextStyle(color: Color(0xff606470), fontSize: 16, fontFamily: "Montserrat"),
                        children: [
                          TextSpan(
                            recognizer: TapGestureRecognizer() ..onTap = () {
                              // Navigate Register Page
                              Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()));
                            },
                            text: S.current.SignUpForNewAccount,
                            style: TextStyle(color: Color(0xff3277D8), fontSize: 16, fontFamily: "Montserrat"),
                          ),
                        ]
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
  void Login_Clicked() {

  }
}