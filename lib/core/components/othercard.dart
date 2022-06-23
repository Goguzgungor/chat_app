import 'package:chat_app/core/base/state/base_state.dart';
import 'package:flutter/material.dart';

class OtherCard extends StatefulWidget {
  final String text1;
  OtherCard({Key? key, required this.text1}) : super(key: key);

  @override
  State<OtherCard> createState() => _OtherCardState();
}

class _OtherCardState extends BaseState<OtherCard> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Card(
        color: Color.fromARGB(255, 142, 243, 146),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: dynamicWidth(20), vertical: dynamicHeight(10)),
          child: Text(widget.text1),
        ),
      ),
    );
  }
}
