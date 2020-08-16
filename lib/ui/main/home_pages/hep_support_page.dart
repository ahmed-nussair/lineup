import 'package:flutter/material.dart';

import 'back_button.dart';

class HelpAndSupport extends StatefulWidget {
  final Function onBackTapped;

  HelpAndSupport({@required this.onBackTapped});

  @override
  _HelpAndSupportState createState() => _HelpAndSupportState();
}

class _HelpAndSupportState extends State<HelpAndSupport> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Text('Help & Support page'),
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
