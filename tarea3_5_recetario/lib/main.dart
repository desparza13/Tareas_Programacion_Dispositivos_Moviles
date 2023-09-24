import 'package:flutter/material.dart';
import 'home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recetario App',
      theme: ThemeData(
        brightness: Brightness.dark, // Define el tema general como oscuro
        primarySwatch: Colors.brown, 
      ),
      home: HomePage(),
    );
  }
}
