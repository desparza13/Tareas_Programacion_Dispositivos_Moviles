import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:contador2_0/Providers/counter_provider.dart';

class Extra extends StatefulWidget {
  const Extra({super.key});

  @override
  State<Extra> createState() => _ExtraState();
}
class _ExtraState extends State<Extra> {
  @override
  Widget build(BuildContext context) {
    // Determinar el color de fondo para el valor actual
    Color backgroundColor = context.read<CounterProvider>().getColor();

    return Container(
      color: backgroundColor,
    );
  }
}
