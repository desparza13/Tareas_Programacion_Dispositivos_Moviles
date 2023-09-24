import 'package:flutter/material.dart';
import 'item_recipe.dart';
import 'data/dummy_data.dart';
import 'details_page.dart'; 

class CategoryPage extends StatelessWidget {
  final String id;
  final String category;

  CategoryPage({required this.id, required this.category});

  @override
  Widget build(BuildContext context) {
    final categoryMeals = dummyMeals.where((meal) {
      return meal.categories.contains(id); 
    }).toList();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(category),
      ),
      body: 
      //Crear lista de todas las recetas que pertenezcan a la categoria
      ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (ctx, index) {
          return GestureDetector( 
            //Al dar click ir a la pagina de detalles de esa comida en especifico
            onTap: () { 
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => DetailsPage(meal: categoryMeals[index]),
              ));
            }, 
            child: 
            //Mostrar la receta usando el widget ItemRecipe
            ItemRecipe(
              imageUrl: categoryMeals[index].imageUrl,
              title: categoryMeals[index].title,
              preparationTime: '${categoryMeals[index].duration} min',
              difficulty: categoryMeals[index].complexity.toString().split('.').last,
              cost: categoryMeals[index].affordability.toString().split('.').last,
            ),
          );
        },
      ),
    );
  }
}
