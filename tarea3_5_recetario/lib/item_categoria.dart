import 'package:flutter/material.dart';
import 'category_page.dart';

class ItemCategoria extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  ItemCategoria({required this.id, required this.title, required this.color});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.circle, color: color), // Circulito del color que diga la Category en dummy data
      title: Text(title, style: TextStyle(color: Colors.white)),
      trailing: Icon(Icons.arrow_forward, color: Colors.white), //Flechita para dejar en claro que den click
      //Redirigir
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryPage(id: id, category: title),
          ),
        );
      },
    );
  }
}
