import 'package:flutter/material.dart';

import 'back_button.dart';

class TermsAndConditions extends StatefulWidget {
  final Function onBackTapped;

  TermsAndConditions({@required this.onBackTapped});

  @override
  _TermsAndConditionsState createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Text('TermsAndConditions page'),
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
