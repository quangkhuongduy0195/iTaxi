
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class FireAuth{

  FirebaseAuth _fireBaseAuth = FirebaseAuth.instance;

  void signIn(String mail, String password, Function onSuccess, Function onError){
    _fireBaseAuth.signInWithEmailAndPassword(email: mail, password: password).then((user) {
      debugPrint("=====$user");
      onSuccess();
    }).catchError((error){
      _signInError(error.code, onError);
    });
  }

  void signUp(String mail, String password, String name, String phone, Function onSuccess, Function handleError){
    _fireBaseAuth.createUserWithEmailAndPassword(email: mail, password: password).then((result) {
      debugPrint("=====$result");
      _createUser(result.user.uid, name, phone, onSuccess, handleError);
    }).catchError((onError) {
      _signUpError(onError.code, handleError);
    });
  }

  _createUser(String userId, String name, String phone, Function onSuccess, Function handleError){
    var user = {
      "name" : name,
      "phone" : phone
    };
    var ref = FirebaseDatabase.instance.reference().child("user");
    ref.child(userId).set(user).then((rsUser) {
      debugPrint("==userId===OK");
      onSuccess();
    }).catchError((onError){
      // TODO Handle Error Here
      debugPrint("=onError====$onError");
      handleError();
    });
  }

  _signUpError(String code, Function(String) handleError){
    var message = "";
    switch(code){
      case "email-already-in-use":
        message = "Email already exists an account";
        break;
      case "invalid-email":
        message = "email address is not valid";
        break;
      case "operation-not-allowed":
        message = "email/password accounts are not enabled.";
        break;
      case "weak-password":
        message = "the password is not strong enough";
        break;
    }
    handleError(message);
  }

  _signInError(String code, Function(String) handleError){
    var message = "";
    switch(code){
      case "user-disabled":
        message = "The user corresponding to the given email has been disabled.";
        break;
      case "invalid-email":
        message = "email address is not valid";
        break;
      case "user-not-found":
        message = "there is no user corresponding to the given email.";
        break;
      case "wrong-password":
        message = "the password is invalid for the given email";
        break;
    }
    handleError(message);
  }

}