import 'package:flutter/material.dart';

class ItemRecipe extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String preparationTime;
  final String difficulty;
  final String cost;

  ItemRecipe({
    required this.imageUrl,
    required this.title,
    required this.preparationTime,
    required this.difficulty,
    required this.cost,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        children: [
          //Imagen
          Image.asset(imageUrl, fit: BoxFit.cover), 
          //Acomodar el cuadro negro degradado
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              //Cuadro negro medio transparentoso
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.black.withOpacity(0.6), Colors.black.withOpacity(0.9)],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  //Textos
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Nombre del platillo
                      Center(
                        child: Text(
                          title,
                          style: const TextStyle(color: Colors.white, fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 8),
                      //Fila con tiempo, complejidad y precio
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.timer, color: Colors.white, size: 16),
                              const SizedBox(width: 4),
                              Text(preparationTime, style: const TextStyle(color: Colors.white)),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(Icons.work, color: Colors.white, size: 16),
                              const SizedBox(width: 4),
                              Text(difficulty, style: const TextStyle(color: Colors.white)),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(Icons.attach_money, color: Colors.white, size: 16),
                              const SizedBox(width: 4),
                              Text(cost, style: const TextStyle(color: Colors.white)),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
