// import 'package:chat_app/core/firebase/firestore/firestore_menager.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class StreamView extends StatefulWidget {
//   const StreamView({Key? key}) : super(key: key);

//   @override
//   State<StreamView> createState() => _StreamViewState();
// }

// final Stream? _stream = FirestoreManager.instance.getStream('users');

// class _StreamViewState extends State<StreamView> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: StreamBuilder(
//           stream: _stream,
//           builder: (context, snapshot) {
//             if (snapshot.hasError) {
//               return Text('Something went wrong');
//             }
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return Text("Loading");
//             }
//             return ListView(
//               children: snapshot.data!.docs.Map((DocumentSnapshot document) {
//                 Map data = document.data() as Map;
//                 return ListTile(
//                   title: Text(data[1]['name']),
//                   subtitle: Text(data[1]['phone']),
//                 );
//               }).toList(),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
