import 'package:flutter/material.dart';
import 'package:info_lugar/info_lugar.dart';
import 'package:info_lugar/item_actividad.dart';

class HomePage extends StatelessWidget {
  HomePage({
    Key? key,
  }) : super(key: key);

  final List<Map<String, String>> _day_activities = [
    {
      "day": "Day 1",
      "image": "assets/images/bali_mountains.jpeg",
      "title": "Bali mountains"
    },
    {
      "day": "Day 2",
      "image": "assets/images/bali_besakhi_temple.jpeg",
      "title": "Besakhi temple"
    },
    {
      "day": "Day 3",
      "image": "assets/images/bali_mount_batur.jpeg",
      "title": "Mount Batur"
    },
    {
      "day": "Day 4",
      "image": "assets/images/bali_ubud.jpeg",
      "title": "Ubud"
    },
    {
      "day": "Day 5",
      "image": "assets/images/bali_uluwutu_temple.jpeg",
      "title": "Uluwutu temple"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reserva tu hotel'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            fit: StackFit.expand,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  //Container con imagen de fondo del contenedor
                  height: MediaQuery.of(context).size.height * 0.25,  // Un cuarto de la altura del espacio disponible
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),  // Esquinas redondeadas
                    image: DecorationImage(
                      image: AssetImage('assets/images/bali_beach.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 64,
                bottom: 0,
                left: 0,
                right: 0,
                child: ListView(
                  children: [
                    InfoLugar(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: Text("Details"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.grey[200],
                          ),
                        ),
                        Text("Walkthrough Flight Detail"),
                      ],
                    ),
                    Container(
                      height: 200,
                      //4. Mostrar elementos en list vies de los días y sus fotos
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _day_activities.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ItemActividad(
                            day: _day_activities[index]['day']!,
                            image: _day_activities[index]['image']!,
                            title: _day_activities[index]['title']!,
                          );
                        },
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        //6.Snackbar al presionar el botón rojo Start booking
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(
                            SnackBar(
                              content: Text("Reservación en progreso"),
                            ),
                          );
                      },
                      child: Text(
                        "Start booking",
                        //5. Cambio de color del botón "Start booking"
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.red,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
