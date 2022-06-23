import 'package:chat_app/core/base/state/base_state.dart';
import 'package:chat_app/core/constants/authconst.dart';
import 'package:chat_app/core/firebase/auth/auth.dart';
import 'package:chat_app/core/viewmodels/authview_model.dart';
import 'package:chat_app/ui/homeview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class AuthView extends StatefulWidget {
  AuthView({Key? key}) : super(key: key);

  @override
  State<AuthView> createState() => _AuthViewState();
}

TextEditingController mailCont = TextEditingController();
TextEditingController passCont = TextEditingController();
TextEditingController nameCont = TextEditingController();

AuthViewModel viewModel = AuthViewModel();

class _AuthViewState extends BaseState<AuthView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        reverse: false,
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          SizedBox(
            height: dynamicHeight(250),
          ),
          Observer(builder: (_) {
            return Visibility(
              visible: viewModel.isVisible(viewModel.authType),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: dynamicWidth(35)),
                child: TextField(
                  keyboardType: TextInputType.name,
                  controller: nameCont,
                  decoration: InputDecoration(hintText: 'Name'),
                ),
              ),
            );
          }),
          SizedBox(
            height: dynamicHeight(35),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: dynamicWidth(35)),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              controller: mailCont,
              decoration: InputDecoration(hintText: 'E-mail'),
            ),
          ),
          SizedBox(
            height: dynamicHeight(35),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: dynamicWidth(35)),
            child: TextField(
              keyboardType: TextInputType.number,
              controller: passCont,
              decoration: InputDecoration(hintText: 'Password'),
            ),
          ),
          SizedBox(
            height: dynamicHeight(35),
          ),
          Observer(builder: (_) {
            return ElevatedButton(onPressed: () => viewModel.authFonc(mailCont.text, passCont.text, nameCont.text, context), child: Text(viewModel.authType));
          }),
          Observer(builder: (_) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                    onPressed: () {
                      viewModel.changeType();
                    },
                    child: Text(AUTHCONST.LOGIN, style: TextStyle(color: viewModel.textCol1))),
                TextButton(
                    onPressed: () {
                      viewModel.changeType();
                    },
                    child: Text(AUTHCONST.REGISTER, style: TextStyle(color: viewModel.textCol2))),
              ],
            );
          })
        ]),
      ),
    );
  }
}
