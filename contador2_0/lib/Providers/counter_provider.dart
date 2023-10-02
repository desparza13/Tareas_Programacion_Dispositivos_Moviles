import 'package:flutter/material.dart';

class CounterProvider with ChangeNotifier{
  int _counter = 0; //Variable privada, la usamos en el provider namas

  int get counter => _counter; // Variable publica
  //TAB Suma y resta
  //Suma
  void increment(){
    _counter++;
    notifyListeners(); // Le avisa a los listeners que cambio un dato
  }

  //Resta
  void decrement(){
    _counter--;
    notifyListeners(); // Le avisa a los listeners que cambio un dato
  }

  //Reset a 0
  void reset(){
    _counter = 0;
    notifyListeners(); // Le avisa a los listeners que cambio un dato
  }

  //TAB Multiplica
  //X2
  void multiDos(){
    _counter = _counter*2;
    notifyListeners(); // Le avisa a los listeners que cambio un dato
  }

  //X3
  void multiTres(){
    _counter = _counter*3;
    notifyListeners(); // Le avisa a los listeners que cambio un dato
  }

  //X5
  void multiCinco(){
    _counter = _counter*5;
    notifyListeners(); // Le avisa a los listeners que cambio un dato
  }

  //TAB Primo
  bool esPrimo() {
    //0 y 1 no son primos
    if (_counter < 2) {
      return false;
    }
    for (int i = 2; i <= _counter / 2; i++) {
      //Tiene otro divisor aparte de 1 y si mismo por lo que no es primo
      if (_counter % i == 0) {
        return false;
      }
    }
    return true;
  }

  //TAB Extra
Color getColor() {
  if (_counter <= 100) {
    int block = _counter ~/ 10; // División entera para segmentar en bloques de 10 números
    //Multiplicar y dividir porque el cambio de color no era muy notorio sin eso
    int baseColor = (block * 25 + 50) % 255; // Residup de  % 255 para asegurarnos de que no exceda 255 (limite en colorcitos)

  //Crear un color con los valores (el rojo el mismo numero, el verde la diferencia entre el rojo y 255, el azul la mitad mas la mitad del valor calculado, azul fijo)
    return Color.fromRGBO(baseColor, 255 - baseColor, 127 + baseColor ~/ 2, 1);
  } else {
    return const Color.fromARGB(255, 255, 173, 201); // Color rosita para números mayores de 100
  }
}



}