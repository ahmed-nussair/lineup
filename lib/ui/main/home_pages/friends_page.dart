import 'package:flutter/material.dart';

import 'back_button.dart';

class Friends extends StatefulWidget {
  final Function onBackTapped;

  Friends({@required this.onBackTapped});

  @override
  _FriendsState createState() => _FriendsState();
}

class _FriendsState extends State<Friends> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Text('Friends page'),
        ),
        Positioned(
          top: 0.0,
          left: 0.0,
          child: AppBackButton(
            onPressed: widget.onBackTapped,
          ),
        )
      ],
    );
  }
}
