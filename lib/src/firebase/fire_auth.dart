
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';

class FireAuth{

  FirebaseAuth _fireBaseAuth = FirebaseAuth.instance;

  void signUp(String mail, String password, String name, String phone, Function onSuccess, Function onError){
    _fireBaseAuth.createUserWithEmailAndPassword(email: mail, password: password).then((result) {
      debugPrint("=====$result");
      _createUser(result.user.uid, name, phone, onSuccess, onError);
    }).catchError((onError) {
      // TODO Handle Error Here
      onError();
      debugPrint("=signUp onError====$onError");
    });
  }

  _createUser(String userId, String name, String phone, Function onSuccess, Function onError){
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
      onError();
    });
  }

}