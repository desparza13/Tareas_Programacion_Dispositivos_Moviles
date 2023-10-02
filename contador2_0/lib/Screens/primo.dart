import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:contador2_0/Providers/counter_provider.dart';

class Primo extends StatefulWidget {
  const Primo({super.key});

  @override
  State<Primo> createState() => _PrimoState();
}

class _PrimoState extends State<Primo> {
  @override
  Widget build(BuildContext context) {
    bool primo = context.read<CounterProvider>().esPrimo();
    return Center(
      child: Text(
        primo ? "Primo" : "No es primo",
        style: TextStyle(
          fontSize: 40,
          color: primo ? Colors.green : Colors.blue,
        ),
      ),
    );
  }
}