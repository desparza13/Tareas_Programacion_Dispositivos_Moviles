import 'package:flutter/material.dart';

void main() {
  runApp(
      const MyApp()); //Le decimos a flutter que en el main queremos que corra la aplicación con la clase "My App"
}

class MyApp extends StatelessWidget {
  //Definimos la clase MyApp de un StatelessWidget (No se mueve)
  const MyApp(
      {super.key}); //Pasamos los parametros como cualquier clase (Esto lo aprendieron en POO)

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //Creamos el contexto de nuestra clase
    return MaterialApp(
      //La clase debe retornar algo! En este caso un Widget de tipo MaterialApp
      title: 'McFlutter', //Un atributo de MaterialApp es el titulo de tu app
      theme: ThemeData(
        //Otro atributo es theme, nos ayuda a darle color y personalización de estilo a tu app que puedes utilizar en cualquier lugar
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(
                255, 77, 129, 248)), //Color principal de mi app
        useMaterial3: true, // Utilizamos Material Design
      ),
      home:
          const McFlutter(), //Otro atributo de Material App, es la pantalla home , en este caso le paso otra clase, la clase "McFlutter"
    );
  }
}

class McFlutter extends StatelessWidget {
  const McFlutter({super.key});

  @override
  Widget build(BuildContext context) {
    //Definimos la clase BirthdayCard de un StatelessWidget (No se mueve)
    return Scaffold(
        //Al igual que arriba lo ponemos en un Scaffold para que tengamos App Bar
        appBar: AppBar(
          centerTitle:
              false, //Le decimos que no este centrado ya que el default en iOS es centrado
          backgroundColor: Colors.blue, //Damos color de fondo aunque podríamos tomarlo del contexto de la app
          title: const Text(
            'Mc Flutter',
            style: TextStyle(color: Colors.white),
          ), //El título ahora no es un simple texto, añadimos estilo, color
        ),
        body: Column(
          //El cuerpo de nuestro Scaffold va a ser una columna
          children: [
            Container(
              padding: const EdgeInsets.all(10.0),
              child: const Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black, width: 1)
                ),
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.account_circle,
                        size: 50,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Flutter McFlutter",
                            style: TextStyle(
                              fontSize: 22,
                              //fontWeight: FontWeight.bold,
                            )
                          ),
                          Text("Experienced App Developer",
                            style: TextStyle(
                              fontSize: 13,
                            )
                          )
                        ]
                      )
                    ]
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
