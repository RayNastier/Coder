import 'package:flutter/material.dart';

class Category {
  String name;
  IconData icon;
  Color color;

  Category({required this.name, required this.icon, required this.color});
}

List<Category> categories = [
  Category(
    name: 'Favorites',
    icon: Icons.favorite_rounded,
    color: Colors.red.shade700),
Category(
    name: 'Favorites',
    icon: Icons.star_rounded,
    color: Colors.amberAccent.shade700),
Category(
    name: 'Favorites',
    icon: Icons.navigation_rounded,
    color: Colors.lightBlue.shade400),
];

