import 'package:flutter/material.dart';

class Pagina3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 3'),
      ),
      body: Column(
        children: [Row(
          //Alinear
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, '(◕‿◕✿)');
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 237, 237, 237), 
                  foregroundColor: Colors.black,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero, 
                  ),
              ),
              child: const Text('(◕‿◕✿)'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, 'ʕ·ᴥ·ʔ');
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, 
                  foregroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero, 
                  ),
              ),
              child: const Text('ʕ·ᴥ·ʔ'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, '¯_(ツ)_/¯');
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 237, 237, 237), 
                  foregroundColor: Colors.black,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero, 
                  ),
              ),
              child: const Text('¯\_(ツ)_/¯'),
            ),
          ],
        )],
      ),
    );
  }
}
