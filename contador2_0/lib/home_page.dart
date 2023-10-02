import 'package:flutter/material.dart';
import 'package:contador2_0/Screens/multiplica.dart';
import 'package:contador2_0/Screens/primo.dart';
import 'package:contador2_0/Screens/suma_resta.dart';
import 'package:contador2_0/Screens/extra.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedPage = 0;

  final List<Widget> _pages = [
    const SumaResta(),
    const Multiplica(),
    const Primo(),
    //puntos extra
    const Extra()
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contador 2.0'),
      ),
      body: _pages[_selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPage,
        onTap: (int index){
          setState(() {
            _selectedPage = index;
          });
        },
        items: const [
          //añadi el background porque son ahora mas de 3
          BottomNavigationBarItem(icon: Icon(Icons.one_k), label: 'Suma', backgroundColor: Colors.blue),
          BottomNavigationBarItem(icon: Icon(Icons.two_k), label: 'Multiplica', backgroundColor: Colors.blue),
          BottomNavigationBarItem(icon: Icon(Icons.three_k), label: 'Primo', backgroundColor: Colors.blue),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Extra', backgroundColor: Colors.blue)
        ],
      ),
      );
    
  }
}