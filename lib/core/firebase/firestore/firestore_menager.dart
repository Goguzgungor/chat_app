import 'package:chat_app/core/firebase/firestore/get_firestoredata.dart';
import 'package:chat_app/core/memory/preferences_keys.dart';
import 'package:chat_app/core/memory/preferences_manager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreManager {
  static FirestoreManager? _instance;
  static FirestoreManager get instance {
    _instance ??= FirestoreManager._init();
    return _instance!;
  }

  FirestoreManager._init();
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<List> getDocumentFromFirestore(String collectionName) async {
    CollectionReference datatable = firestore.collection(collectionName);
    QuerySnapshot data = await datatable.get();
    return data.docs;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getStream(String collectionName) {
    var datatable = firestore.collection(collectionName).snapshots();

    return datatable;
  }

  getStreamDoc(String collectionName) async {
    var datatable = firestore.collection(collectionName);
    QuerySnapshot data = await datatable.get();
    return data.docs;
  }

  setStatus(String collectionName, String uid, String status) {
    firestore.collection(collectionName).doc(uid).update({'status': status});
  }

  Future<void> addDocumenttoFirestore(
      String collectionName, String name, String phone, String mail, String company, String position, String linkedIn, String instagram, String github, String twitter) async {
    await firestore.collection(collectionName).doc('SOMEUSER').collection('').add({});
    await FirestoreGetData().getUserData(collectionName);
  }

  Future<void> addDocumenttoStream(String text1, String uid, String nextUid, FieldValue timeStamp) async {
    await firestore.collection(uid).doc('myChats').collection(nextUid).add({'text': text1, 'uid': uid, 'timeStamp': timeStamp});
    await firestore.collection(nextUid).doc('myChats').collection(uid).add({'text': text1, 'uid': uid, 'timeStamp': timeStamp});
  }

  Future<void> addUserToFirestore(
    String collectionName,
    String mail,
    String uid,
    String name,
  ) async {
    await firestore.collection(collectionName).doc(uid).set({
      'mail': mail,
      'uid': uid,
      'name': name,
      'status': 'Unavailable',
    });
    await FirestoreGetData().getUserData(collectionName);
  }

  Future<void> removeDocumentformFirestore(String collectionName, String phone) async {
    QuerySnapshot doc = await firestore.collection(collectionName).doc('SOMEUSER').collection('').where(collectionName, isEqualTo: phone).get();

    doc.docs.forEach((element) => element.reference.delete());
  }
}
