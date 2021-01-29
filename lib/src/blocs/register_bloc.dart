
import 'dart:async';

import 'package:Taxi/generated/l10n.dart';
import 'package:Taxi/src/common/validator.dart';
import 'package:Taxi/src/firebase/fire_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class RegisterBloc{
  StreamController _nameController = new StreamController();
  StreamController _phoneController = new StreamController();
  StreamController _emailController = new StreamController();
  StreamController _passwordController = new StreamController();

  Stream get nameStream => _nameController.stream;
  Stream get phoneStream => _phoneController.stream;
  Stream get emailStream => _emailController.stream;
  Stream get passwordStream => _passwordController.stream;

  FireAuth _fireAuth = new FireAuth();

bool valid(String name, String phone, String mail, String password){

  if(Validator.validName(name)){
    _nameController.sink.add("OK");
  } else {
    _nameController.sink.addError(S.current.InvalidName);
    return false;
  }

  if(Validator.validPhone(phone)){
    _phoneController.sink.add("OK");
  } else {
    _phoneController.sink.addError(S.current.InvalidPhoneNumber);
    return false;
  }

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
  
void signUp(String name, String phone, String mail, String password, Function onSuccess, Function onError){
  _fireAuth.signUp(mail, password, name, phone, onSuccess, onError);
}

  void dispose(){
    _nameController.close();
    _phoneController.close();
    _emailController.close();
    _passwordController.close();
    _fireAuth = null;
  }
}