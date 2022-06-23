import 'package:chat_app/core/base/state/base_state.dart';
import 'package:chat_app/core/firebase/firestore/firestore_menager.dart';
import 'package:chat_app/core/memory/preferences_keys.dart';
import 'package:chat_app/core/memory/preferences_manager.dart';
import 'package:chat_app/ui/homeview.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SendingBar extends StatefulWidget {
  final String nextUid;
  SendingBar({Key? key, required this.nextUid}) : super(key: key);
  TextEditingController cont = TextEditingController();

  @override
  State<SendingBar> createState() => _SendingBarState();
}

class _SendingBarState extends BaseState<SendingBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: width - dynamicWidth(80),
            child: TextField(
              controller: cont,
              decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
            ),
          ),
        ),
        ElevatedButton(
            onPressed: () async {
              await FirestoreManager.instance.addDocumenttoStream(cont.text, PreferencesManager.instance.getStringVal(PreferencesKeys.USERID), widget.nextUid, FieldValue.serverTimestamp());
            },
            child: Text('Send'))
      ],
    );
  }
}
