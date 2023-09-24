import 'package:flutter/material.dart';

//Modelo de categoría
class Category {
  final String id;
  final String title;
  final Color color;

  const Category({
    required this.id,
    required this.title,
    required this.color,
  });
}
