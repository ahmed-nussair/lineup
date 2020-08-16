import 'package:flutter/material.dart';
import 'package:lineup/ui/main/home_pages/back_button.dart';

class Orders extends StatefulWidget {
  final Function onBackTapped;

  Orders({@required this.onBackTapped});

  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Text('Orders Page'),
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
