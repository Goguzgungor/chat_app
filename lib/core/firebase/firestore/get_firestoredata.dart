import 'package:chat_app/core/firebase/firestore/firestore_menager.dart';
import 'package:chat_app/core/memory/hive_constant.dart';
import 'package:chat_app/core/memory/hive_menager.dart';
import 'package:chat_app/core/memory/preferences_keys.dart';
import 'package:chat_app/core/memory/preferences_manager.dart';

class FirestoreGetData {
  Future<void> getUserData(String collettionName) async {
    List<dynamic> templist = [];
    List docs = await FirestoreManager.instance.getDocumentFromFirestore(collettionName);
    for (int i = 0; i < docs.length; i++)
      templist.add({
        'name': docs[i]['name'],
        'mail': docs[i]['mail'],
        'uid': docs[i]['uid'],
      });
    print(templist);
    await HiveManager.instance.addListToBox(HiveBoxes.USER, templist);
  }
}
