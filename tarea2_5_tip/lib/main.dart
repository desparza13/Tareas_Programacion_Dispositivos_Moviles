import 'package:flutter/material.dart';
import 'tip.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tarea 2.5: Tip',
      theme: ThemeData(
        primarySwatch: Colors.green
      ),
      home: HomePage());
  }
}
