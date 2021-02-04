
import 'dart:async';

import 'package:Taxi/generated/l10n.dart';
import 'package:Taxi/src/common/validator.dart';
import 'package:Taxi/src/firebase/fire_auth.dart';

class LoginBloc {
  StreamController _emailController = new StreamController();
  StreamController _passwordController = new StreamController();
  FireAuth _fireAuth = new FireAuth();

  bool valid(String mail, String password){
    if(Validator.validEmail(mail)){
      _emailController.sink.add("OK");
    } else {
      _emailController.sink.addError(S.current.InvalidEmail);
      return false;
    }

    if(Validator.validPassword(password)){
      _passwordController.sink.add("OK");
    } else {
      _passwordController.sink.addError(S.current.InvalidPassword);
      return false;
    }
    return true;
  }

  void signIn(String mail, String password, Function onSuccess, Function onError){
    _fireAuth.signIn(mail, password, onSuccess, onError);
  }


  void dispose(){
    _emailController.close();
    _passwordController.close();
    _fireAuth = null;
  }
}