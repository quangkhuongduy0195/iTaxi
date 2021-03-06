import 'package:Taxi/generated/l10n.dart';
import 'package:Taxi/src/blocs/login_bloc.dart';
import 'package:Taxi/src/models/login_info_model.dart';
import 'package:Taxi/src/resources/widgets/loading.dart';
import 'package:Taxi/src/resources/pages/register_page.dart';
import 'package:Taxi/src/utilities/navigation_helper.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../widgets/text_field_border.dart';

class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController _emailController;
  TextEditingController _passwordController;
  LoginBloc _loginBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailController = new TextEditingController();
    _passwordController = new TextEditingController();
    _emailController.text = "DuyQk@gmail.com";
    _passwordController.text = "DuyQK123123";
    _loginBloc = new LoginBloc();

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      key: _scaffoldKey,
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
                      controller: _emailController,
                      icon: Image.asset("ic_mail.png"),
                      placeholder: S.current.Email,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 22, 0, 0),
                    child: TextFieldBorder(
                      controller: _passwordController,
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
                          loginClicked();
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
                              goToRegisterPage(context);
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

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<State> _keyLoader = GlobalKey<State>();

  void loginClicked() {
    if(_loginBloc.valid(_emailController.text, _passwordController.text)){
      Loading.show(context, _keyLoader);
      _loginBloc.signIn(_emailController.text, _passwordController.text, () {
        Loading.hide(_keyLoader.currentContext);
        NavigationHelper.homePage(context);
      }, (message) {
        Loading.hide(_keyLoader.currentContext);
        _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("$message"),duration: Duration(seconds: 5),));
      });
    }
  }

  void goToRegisterPage(BuildContext context) async {
    final Object resultRegister = await NavigationHelper.registerPage(context);
    if(resultRegister != null) {
      final LoginInfoModel result =  resultRegister as LoginInfoModel;
      if(result != null) {
        setState(() {
          _emailController.text = result.email;
          _passwordController.text = result.password;
        });
      }
    } // debugPrint(result);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _loginBloc.dispose();
  }
}