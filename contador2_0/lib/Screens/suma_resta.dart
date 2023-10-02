import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:contador2_0/Providers/counter_provider.dart';

class SumaResta extends StatefulWidget {
  const SumaResta({super.key});

  @override
  State<SumaResta> createState() => _SumaRestaState();
}

class _SumaRestaState extends State<SumaResta> {
  @override
  
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            context.watch<CounterProvider>().counter.toString(), 
            style: const TextStyle(fontSize: 40),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Distribuir equitativamente
            children: [
              //Suma
              ElevatedButton(
                onPressed: () {
                  context.read<CounterProvider>().increment();
                },
                child: const Icon(Icons.add, size: 24), // Icono de suma
              ),
              //Resta
              ElevatedButton(
                onPressed: () {
                  context.read<CounterProvider>().decrement();
                },
                child: const Icon(Icons.remove, size: 24), // Icono de resta
              ),
              //Reset
              ElevatedButton(
                onPressed: () {
                  context.read<CounterProvider>().reset();
                },
                child: const Icon(Icons.refresh, size: 24), // Icono de reinicio
              ),
            ],
          ),
        ],
      ),
    );
  }
}