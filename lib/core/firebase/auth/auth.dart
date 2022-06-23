import 'dart:async';
import 'package:chat_app/core/memory/preferences_keys.dart';
import 'package:chat_app/core/memory/preferences_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthMenager {
  static AuthMenager? _instance;
  static AuthMenager get instance {
    _instance ??= AuthMenager._init();
    return _instance!;
  }

  AuthMenager._init();
  FirebaseAuth auth = FirebaseAuth.instance;
  Future<dynamic> register(String mail, String pass, String repass, BuildContext context) async {
    // Kullanımı : AuthMenager.instance.login(mail, pass)

    if (pass != repass) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('The passwords you entered are not the same.')));
    } else {
      UserCredential user = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: mail, password: pass);
      await PreferencesManager.instance.setStringVal(PreferencesKeys.USERID, user.user!.uid);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Successfully registered.')));
     
    }
  }

  FutureOr<UserCredential> login(String mail, String pass) async {
    UserCredential user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: mail, password: pass);
    await PreferencesManager.instance.setStringVal(PreferencesKeys.USERID, user.user!.uid);
    return user;
  }
}
