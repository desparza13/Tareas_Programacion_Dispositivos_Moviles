import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';  // Importar para generar números aleatorios

class Pagina2 extends StatefulWidget {
  final String data;
  final String numeroGuardado;

  Pagina2({required this.data, required this.numeroGuardado});

  @override
  _Pagina2State createState() => _Pagina2State();
}

class _Pagina2State extends State<Pagina2> {
  String randomData = ""; // Guardará el número aleatorio generado

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.blue,
        title: const Text('Pagina 2'),
      ),
      body: Container(
        //Usar fondo degradado de azul a azul bajito
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue, Color.fromARGB(255, 196, 231, 247)],
          ),
        ),
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40.0, bottom: 10.0),
                child: Text('Genere numero random',
                    style: GoogleFonts.sourceSans3(
                        fontWeight: FontWeight.w900,
                        fontSize: 25,
                        color: Colors.purple)),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Text(randomData.isEmpty ? widget.numeroGuardado : randomData,
                    style: GoogleFonts.sourceSans3(
                        fontWeight: FontWeight.w900,
                        fontSize: 35,
                        color: Colors.red)),
              ),
              ElevatedButton(
                onPressed: () {
                  //Generar un numero aleatorio entre 0 y 999
                  setState(() {
                    randomData = Random().nextInt(1000).toString(); 
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, 
                  foregroundColor: Colors.black,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero, 
                  ),
                ),
                child: const Text('Generar', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              ElevatedButton(
                onPressed: () {
                  if (randomData.isNotEmpty) {
                    //Volver pasando la info
                    Navigator.pop(context, randomData);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // Color de fondo del botón
                  foregroundColor: Colors.black,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero, 
                  ), // Color del texto del botón
                ),
                child: const Text('Guardar', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
