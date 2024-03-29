import 'package:flutter/material.dart';

import 'back_button.dart';

class SettingsPage extends StatefulWidget {
  final Function onBackTapped;

  SettingsPage({@required this.onBackTapped});

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Text('Settings page'),
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
