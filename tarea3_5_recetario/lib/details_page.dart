import 'package:flutter/material.dart';
import '../models/recipe.dart';

class DetailsPage extends StatefulWidget {
  final Meal meal;

  const DetailsPage({required this.meal});

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  bool isFavorite = false; // Para manejar si es un favorito o no.

  void toggleFavoriteStatus() {
      //Cambiar entre favorito o no
      setState(() {
        isFavorite = !isFavorite;
      });

      //Snackbar de añadiste o quitaste de favoritos
      ScaffoldMessenger.of(context).hideCurrentSnackBar(); // Esconde el SnackBar actual si hay uno
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(isFavorite ? "Meal added to favs" : "Meal no longer in favs"),
        ),
      );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //Titulo que sea el nombre de la receta
        title: Text(widget.meal.title, style: const TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: Icon(isFavorite ? Icons.star : Icons.star_border, color: Colors.white), // Estrella rellena o no
            onPressed: toggleFavoriteStatus, // Función que cambia el estado del favorito
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(widget.meal.imageUrl, fit: BoxFit.cover), 
            const SizedBox(height: 20), // Más espacio
            //Poner el titulo de Ingredients y mapear cada ingrediente de la receta a un texto centrado
            const Text('Ingredients', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 250, 193, 107))),
            //Mapeo de ingredientes
            ...widget.meal.ingredients.map((ingredient) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: Text(ingredient, style: const TextStyle(color: Colors.white))), 
            )),
            const SizedBox(height: 20), 
            //Piner el titulo de Steps y mapear cada paso de la receta a un texto centrado
            const Text('Steps', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 250, 193, 107))), 
            //Mapeo de pasos
            ...widget.meal.steps.map((step) => Padding(
              padding: const EdgeInsets.all(8.0), 
              child: Center(child: Text(step, style: const TextStyle(color: Colors.white)), 
            ))),
            const SizedBox(height: 20),
            //Fila con iconitos de tipos de comida: glutenFree, vegano, vegetariano, etc
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //Si es gluten free mostrar su icono :) y texto para que sea claro
                if (widget.meal.isGlutenFree) const Column(
                  children: [
                    Icon(Icons.check_circle_outline, color: Color.fromARGB(255, 250, 193, 107)),
                    Text('Gluten Free', style: TextStyle(color: Colors.white)),
                  ],
                ),
                //Si es vegano mostrar su icono y texto para que sea claro
                if (widget.meal.isVegan) const Column(
                  children: [
                    Icon(Icons.nature, color: Color.fromARGB(255, 250, 193, 107)),
                    Text('Vegan', style: TextStyle(color: Colors.white)),
                  ],
                ),
                //Si es vegetariano mostrar su icono y texto para que sea claro
                if (widget.meal.isVegetarian) const Column(
                  children: [
                    Icon(Icons.food_bank, color: Color.fromARGB(255, 250, 193, 107)),
                    Text('Vegetarian', style: TextStyle(color: Colors.white)),
                  ],
                ),
                //Si es deslactosado mostrar su icono y texto para que sea claro
                if (widget.meal.isLactoseFree) const Column(
                  children: [
                    Icon(Icons.local_dining, color: Color.fromARGB(255, 250, 193, 107)),
                    Text('Lactose Free', style: TextStyle(color: Colors.white)),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
