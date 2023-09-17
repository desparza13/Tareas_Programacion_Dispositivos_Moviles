import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pagina2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tarea repaso',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Tarea 1'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String textoDialogo = "";  // Variable para almacenar el texto del diálogo
  String numeroGuardado = "";  // Variable para almacenar el número de la Pagina 2
  String textoPagina3 = "Contenido variable Pg3";  // Contenido variable para Pagina 3

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        //cargar a la izquierda el titulo
        centerTitle: false,
        backgroundColor: Colors.blue,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Center(
                    child: Text('BIENVENIDOS', 
                    //Usar fuente personalizada y color grisesito
                      style: GoogleFonts.pacifico(fontSize: 35, color:const Color.fromARGB(255, 119, 119, 119))), 
                  ),
                  Image.asset('assets/images/dash_dart.png', fit: BoxFit.fitWidth), 
                  const SizedBox(height: 20),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top : 30.0, bottom: 60.0),
                      child: Text(
                      'Seleccione la acción a realizar:',
                      //Usar fuente personalizada de google fonts
                      style: GoogleFonts.sourceSans3(fontWeight: FontWeight.bold, fontSize: 20),
                    ),)
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Ingrese datos', style: TextStyle(fontWeight: FontWeight.bold)),
                                //El campo de input con el 'Ingrese palabras' y limitante a 10 caracteres
                                content: TextField(
                                  maxLength: 10,
                                  decoration: const InputDecoration(
                                    hintText: "Ingrese palabra",
                                  ),
                                  onChanged: (value) {
                                    textoDialogo = value;
                                  },
                                ),
                                actions: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end, // Centers the buttons
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          //Volver a main
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('Cancelar', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                          if (textoDialogo.isNotEmpty) {
                                            //Abrir la pagina 2 y pasarle los datos del dialogo y el numero aleatorio en el que se habia quedado antes la pagina
                                            Navigator.of(context).push(MaterialPageRoute(
                                              builder: (context) => Pagina2(data: textoDialogo, numeroGuardado: numeroGuardado),
                                            )).then((result) {
                                              //Recuperar el numero que se pasó de la pagina 2
                                              if (result != null) {
                                                setState(() {
                                                  numeroGuardado = result as String;
                                                });
                                              }
                                            });
                                          }
                                        },
                                        child: const Text('Aceptar', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: const Text('Pagina 2'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // TODO: Hacer la pagina 3 de botoncitos
                        },
                        style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero, 
                          ),
                        ),
                        child:const Text('Pagina 3'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),  // Espaciado entre las filas
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    //Mostrar los valores de la pagina 2
                    children: [
                      Text('Pg 2 => ', style: GoogleFonts.sourceSans3(fontSize: 14)),
                      Text('$textoDialogo$numeroGuardado', style: GoogleFonts.sourceSans3(fontSize: 14)),
                    ],
                  ),
                  const SizedBox(height: 40),  // Espaciado entre las filas
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Pg 3 => ', style: GoogleFonts.sourceSans3(fontSize: 14)),
                      Text('$textoPagina3', style: GoogleFonts.sourceSans3(fontSize: 14)),
                    ],
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
