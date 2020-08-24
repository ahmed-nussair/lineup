import 'package:flutter/material.dart';

class MealItem {
  final String title;
  final String description;
  final String imageUrl;
  final double price;

  MealItem({
    @required this.title,
    @required this.description,
    @required this.imageUrl,
    @required this.price,
  });
}
