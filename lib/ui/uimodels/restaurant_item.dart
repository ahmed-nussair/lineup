import 'package:flutter/material.dart';

class RestaurantItem {
  String title;
  String backgroundImageUrl;
  String logoUrl;
  List<String> type;
  double distance;
  double rating;

  RestaurantItem({
    @required this.title,
    @required this.backgroundImageUrl,
    @required this.logoUrl,
    @required this.type,
    @required this.distance,
    @required this.rating,
  });

}