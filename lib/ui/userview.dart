import 'package:chat_app/core/base/state/base_state.dart';
import 'package:chat_app/core/firebase/firestore/firestore_menager.dart';
import 'package:chat_app/core/memory/preferences_keys.dart';
import 'package:chat_app/core/memory/preferences_manager.dart';
import 'package:chat_app/core/viewmodels/userview_model.dart';
import 'package:chat_app/ui/homeview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class UserView extends StatefulWidget {
  UserView({Key? key}) : super(key: key);

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends BaseState<UserView> with WidgetsBindingObserver {
  final title = 'Dictionary';
  UserViewModel viewModel = UserViewModel();
  @override
  void initState() {
    super.initState();
    viewModel.getData();
    WidgetsBinding.instance.addObserver(this);
    FirestoreManager.instance.setStatus('users', PreferencesManager.instance.getStringVal(PreferencesKeys.USERID), 'Online');
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      FirestoreManager.instance.setStatus('users', PreferencesManager.instance.getStringVal(PreferencesKeys.USERID), 'Online');
    } else {
      FirestoreManager.instance.setStatus('users', PreferencesManager.instance.getStringVal(PreferencesKeys.USERID), 'Offline');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Column(children: [
          SingleChildScrollView(
            child: Column(mainAxisAlignment: MainAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
              Container(
                height: height / 2 + dynamicHeight(240),
                width: width,
                child: Observer(builder: (_) {
                  return ListView.builder(
                    itemCount: viewModel.userList.length,
                    itemBuilder: (context, index) {
                      if (viewModel.userList[index]['uid'] == PreferencesManager.instance.getStringVal(PreferencesKeys.USERID)) {
                        return SizedBox();
                      } else {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: dynamicWidth(10), vertical: dynamicHeight(5)),
                          child: ListTile(
                            title: Text(viewModel.userList[index]['name']),
                            leading: CircleAvatar(
                              child: Text(viewModel.userList[index]['name'][0]),
                            ),
                            trailing: IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => HomeView(title: viewModel.userList[index]['name'], nextUid: viewModel.userList[index]['uid'], index: index)),
                                  );
                                },
                                icon: Icon(Icons.send)),
                          ),
                        );
                      }
                    },
                  );
                }),
              ),
            ]),
          ),
        ]),
      ),
    );
  }
}
