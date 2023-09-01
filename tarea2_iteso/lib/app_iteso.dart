import 'package:flutter/material.dart';

class AppIteso extends StatefulWidget {
  AppIteso({super.key});

  @override
  _AppItesoState createState() => _AppItesoState();
}

class _AppItesoState extends State<AppIteso> {
  var likes = 0;
  var likeColor = Colors.black54;
  var dislikeColor = Colors.black54;
  var mailColor = Colors.black;
  var callColor = Colors.black;
  var routeColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Iteso'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Image.network(
                "https://cruce.iteso.mx/wp-content/uploads/sites/123/2018/04/Portada-2-e1525031912445.jpg"),
            ListTile(
              title: const Text(
                "El ITESO, Universidad Jesuita de Guadalajara",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              subtitle: const Text(
                "San Pedro Tlaquepaque, Jal",
              ),
              trailing: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  IconButton(
                      icon: const Icon(Icons.thumb_up),
                      color: likeColor,
                      onPressed: () {
                        setState(() {
                          likes++;
                          likeColor = likeColor == Colors.black54
                              ? Colors.indigo
                              : Colors.black54;
                        });
                      }),
                  Text("$likes"),
                  IconButton(
                      icon: const Icon(Icons.thumb_down),
                      color: dislikeColor,
                      onPressed: () {
                        setState(() {
                          likes--;
                          dislikeColor = dislikeColor == Colors.black54
                              ? Colors.indigo
                              : Colors.black54;
                        });
                      }),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: Column(children: [
                    IconButton(
                        icon: const Icon(Icons.mail),
                        iconSize: 55,
                        color: mailColor,
                        onPressed: () {
                          setState(() {
                            mailColor = mailColor == Colors.black
                                ? Colors.indigo
                                : Colors.black;
                          });
                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(const SnackBar(
                                content: Text(
                                    'Puedes mandar correo a admision@iteso.mx')));
                        }),
                    const Text("Correo")
                  ])),
                  Expanded(
                      child: Column(children: [
                    IconButton(
                        icon: const Icon(Icons.add_call),
                        iconSize: 55,
                        color: callColor,
                        onPressed: () {
                          setState(() {
                            callColor = callColor == Colors.black
                                ? Colors.indigo
                                : Colors.black;
                          });
                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(const SnackBar(
                                content: Text(
                                    'Puedes llamar a +52 (33) 3669 3434')));
                        }),
                    const Text("Llamada")
                  ])),
                  Expanded(
                      child: Column(children: [
                    IconButton(
                        icon: const Icon(Icons.directions),
                        iconSize: 55,
                        color: routeColor,
                        onPressed: () {
                          setState(() {
                            routeColor = routeColor == Colors.black
                                ? Colors.indigo
                                : Colors.black;
                          });
                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(const SnackBar(
                                content: Text(
                                    '''El ITESO está en Periférico Sur Manuel Gómez Morín # 8585 C.P. 45604 Tlaquepaque, Jalisco, México''')));
                        }),
                    const Text("Ruta")
                  ])),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(14.0),
              child: Text(
                  "El ITESO, Universidad Jesuita de Guadalajara (Instituto Tecnológico y de Estudios Superiores de Occidente), es una universidad privada ubicada en la Zona Metropolitana de Guadalajara, Jalisco, México, fundada en el año 1957. Fundada en el año de 1957 por el Padre Luis Hernández Prieto S.J.,3​ José Aguilar Figueroa y el ingeniero José Fernández del Valle y Ancira, entre otros, la universidad ha tenido una larga trayectoria. A continuación se presenta la historia de la institución en periodos de décadas."),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(AppIteso());
}
