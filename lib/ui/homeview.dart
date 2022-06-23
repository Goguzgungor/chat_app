import 'package:chat_app/core/base/state/base_state.dart';
import 'package:chat_app/core/components/othercard.dart';
import 'package:chat_app/core/components/sending_bar.dart';
import 'package:chat_app/core/components/usercard.dart';
import 'package:chat_app/core/firebase/firestore/firestore_menager.dart';
import 'package:chat_app/core/memory/preferences_keys.dart';
import 'package:chat_app/core/memory/preferences_manager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  final String title;
  final String nextUid;
  final int index;
  const HomeView({Key? key, required this.title, required this.nextUid, required this.index}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

TextEditingController cont = TextEditingController();

class _HomeViewState extends BaseState<HomeView> {
  @override
  Widget build(BuildContext context) {
    Stream<QuerySnapshot> collectionStream = FirebaseFirestore.instance
        .collection(PreferencesManager.instance.getStringVal(PreferencesKeys.USERID))
        .doc('myChats')
        .collection(widget.nextUid)
        .orderBy('timeStamp', descending: false)
        .snapshots();
    return Scaffold(
        appBar: AppBar(
            title: Row(
          children: [
            Text(widget.title),
            SizedBox(
              width: dynamicWidth(10),
            ),
            Padding(
              padding: EdgeInsets.only(left: dynamicWidth(10), top: dynamicHeight(5)),
              child: StreamBuilder<DocumentSnapshot>(
                stream: FirebaseFirestore.instance.collection('users').doc(widget.nextUid).snapshots(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData) {
                    return Text("Loading");
                  }
                  return Text(
                    snapshot.data['status'],
                    style: TextStyle(fontSize: 12),
                  );
                },
              ),
            ),
          ],
        )),
        body: SingleChildScrollView(
          reverse: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              StreamBuilder<QuerySnapshot>(
                stream: collectionStream,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Text("Loading");
                  }
                  var myList = snapshot.data!.docs;

                  return SafeArea(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: width,
                      height: height * 3 / 4,
                      child: ListView.builder(
                        itemCount: myList.length,
                        itemBuilder: (context, index) {
                          if (myList[index]['uid'] == PreferencesManager.instance.getStringVal(PreferencesKeys.USERID)) {
                            return UserCard(text1: myList[index]['text']);
                          } else if (myList[index]['uid'] == widget.nextUid)
                            return OtherCard(text1: myList[index]['text']);
                          else {
                            return Text('HATA');
                          }
                          // return (massageDecider(myList[index]['uid'], myList[index]['text']));
                        },
                      ),
                    ),
                  ));
                },
              ),
              SendingBar(
                nextUid: widget.nextUid,
              ),
            ],
          ),
        ));
  }
}
