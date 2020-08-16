import 'package:flutter/material.dart';

import 'back_button.dart';

class Profile extends StatefulWidget {
  final Function onBackTapped;

  Profile({@required this.onBackTapped});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Text('Profile Page'),
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
