import 'package:flutter/material.dart';
import 'data/dummy_data.dart';
import 'item_categoria.dart';
//Añadi esta pantalla para que tuviera sentido llegar a una categoria en especifico
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/images/logo_recetario.png'),
            const SizedBox(height: 20),
            const Text(
              'What are you cooking today?',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            Expanded(
              //Construir la lista de categorias de recetas con el widget ItemCategoria a partir de la dummy data
              child: ListView.builder(
                itemCount: availableCategories.length,
                itemBuilder: (ctx, index) {
                  return ItemCategoria(
                    id: availableCategories[index].id,
                    title: availableCategories[index].title,
                    color: availableCategories[index].color,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
