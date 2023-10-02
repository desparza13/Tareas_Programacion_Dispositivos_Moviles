import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:contador2_0/Providers/counter_provider.dart';

class Multiplica extends StatefulWidget {
  const Multiplica({super.key});

  @override
  State<Multiplica> createState() => _MultiplicaState();
}

class _MultiplicaState extends State<Multiplica> {
  void _showMultiplicationSnackBar(BuildContext context, int multiplier) {
    final snackBar = SnackBar(content: Text('Número multiplicado por $multiplier!'));

    // Elimina el SnackBar actual si lo hay
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    // Muestra el nuevo SnackBar
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            context.watch<CounterProvider>().counter.toString(), 
            style: const TextStyle(fontSize: 40),),
          Row(
            mainAxisAlignment: MainAxisAlignment.end, // Distribuir equitativamente
            children: [
              //X2
              ElevatedButton(
                onPressed: () {
                  context.read<CounterProvider>().multiDos();
                  _showMultiplicationSnackBar(context, 2);
                },
                child: const Text('X2'),
              ),
              //X3
              ElevatedButton(
                onPressed: () {
                  context.read<CounterProvider>().multiTres();
                  _showMultiplicationSnackBar(context, 3);
                },
                child: const Text('X3'),
              ),
              //X5
              ElevatedButton(
                onPressed: () {
                  context.read<CounterProvider>().multiCinco();
                  _showMultiplicationSnackBar(context, 5);
                },
                child: const Text('X5'), 
              ),
            ],
          ),
        ],
      ),
    );
  }
}