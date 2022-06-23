import 'package:chat_app/core/firebase/firestore/get_firestoredata.dart';
import 'package:chat_app/core/memory/hive_menager.dart';
import 'package:chat_app/core/memory/preferences_manager.dart';
import 'package:chat_app/ui/homeview.dart';
import 'package:chat_app/ui/auth_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await PreferencesManager.preferencesInit();
  await HiveManager.instance.hiveInit();
  FirestoreGetData().getUserData('users');

  runApp(MyApp());
}

String title = 'RealTime Chat App';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      home: AuthView(),
    );
  }
}
