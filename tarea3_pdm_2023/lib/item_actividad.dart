import 'package:flutter/material.dart';

class ItemActividad extends StatelessWidget {
  final String day;
  final String image;
  final String title;

  ItemActividad({
    required this.day,
    required this.image,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(day, style: TextStyle(fontSize: 11)),
          Text(title),
        ],
      ),
    );
  }
}







