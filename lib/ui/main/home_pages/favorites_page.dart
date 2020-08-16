import 'package:flutter/material.dart';

import 'back_button.dart';

class Favorites extends StatefulWidget {
  final Function onBackTapped;

  Favorites({@required this.onBackTapped});

  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Text('Favourites Page'),
        ),
        Positioned(
          top: 0.0,
          left: 0.0,
          child: AppBackButton(
            onPressed: () => widget.onBackTapped(),
          ),
        )
      ],
    );
  }
}
