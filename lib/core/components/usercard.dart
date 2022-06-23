import 'package:chat_app/core/base/state/base_state.dart';
import 'package:flutter/material.dart';

class UserCard extends StatefulWidget {
  final String text1;
  UserCard({Key? key, required this.text1}) : super(key: key);

  @override
  State<UserCard> createState() => _UserCardState();
}

class _UserCardState extends BaseState<UserCard> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Card(
        color: Color.fromARGB(255, 255, 218, 106),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: dynamicWidth(20), vertical: dynamicHeight(10)),
          child: Text(widget.text1),
        ),
      ),
    );
  }
}
