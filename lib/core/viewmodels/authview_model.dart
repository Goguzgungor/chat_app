import 'package:chat_app/core/constants/authconst.dart';
import 'package:chat_app/core/firebase/auth/auth.dart';
import 'package:chat_app/core/firebase/firestore/firestore_menager.dart';
import 'package:chat_app/core/firebase/firestore/get_firestoredata.dart';
import 'package:chat_app/core/memory/preferences_keys.dart';
import 'package:chat_app/core/memory/preferences_manager.dart';
import 'package:chat_app/ui/auth_view.dart';
import 'package:chat_app/ui/homeview.dart';
import 'package:chat_app/ui/userview.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'authview_model.g.dart';

class AuthViewModel = _AuthViewModelBase with _$AuthViewModel;

abstract class _AuthViewModelBase with Store {
  @observable
  Color textCol2 = Colors.grey;
  @observable
  Color textCol1 = Colors.black;

  @observable
  String authType = AUTHCONST.LOGIN;
  @action
  changeType() {
    if (authType == AUTHCONST.LOGIN) {
      authType = AUTHCONST.REGISTER;
      textCol1 = Colors.grey;
      textCol2 = Colors.black;
      print(authType);
    } else {
      authType = AUTHCONST.LOGIN;
      print(authType);
      textCol1 = Colors.black;
      textCol2 = Colors.grey;
    }
  }

  @action
  bool isVisible(String Authtype) {
    if (authType == AUTHCONST.REGISTER) {
      return true;
    }
    return false;
  }

  @action
  authFonc(String mail, String pass, String name, BuildContext context) async {
    if (authType == AUTHCONST.LOGIN) {
      await AuthMenager.instance.login(mail, pass);
      await FirestoreGetData().getUserData('users');

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => UserView(),
        ),
      );
    }
    if (authType == AUTHCONST.REGISTER) {
      await AuthMenager.instance.register(mail, pass, pass, context);
      String uid = PreferencesManager.instance.getStringVal(PreferencesKeys.USERID);
      await FirestoreManager.instance.addUserToFirestore('users', mail, uid, name);
    }
  }
}
