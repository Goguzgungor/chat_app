// import 'package:chat_app/core/base/state/base_state.dart';
// import 'package:chat_app/core/components/sending_bar.dart';
// import 'package:chat_app/main.dart';
// import 'package:flutter/material.dart';

// class MessageView extends StatefulWidget {
//   final String title;
//   MessageView({Key? key, required this.title}) : super(key: key);

//   @override
//   State<MessageView> createState() => _MessageViewState();
// }

// TextEditingController cont = TextEditingController();

// class _MessageViewState extends BaseState<MessageView> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(title),
//       ),
//       body: Column(mainAxisAlignment: MainAxisAlignment.end, children: [SendingBar(cont: cont, text: 'text', dateTime: 'dateTime', func: print(''),)]),
//     );
//   }
// }
