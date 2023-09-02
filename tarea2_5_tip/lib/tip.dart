import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var serviceController = TextEditingController();
  int tipPercentage = 0;
  bool roundUp = false;
  int selectedRadio = 0;
  double calculatedTip = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tip Time'),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: serviceController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                icon: Icon(Icons.room_service),
                labelText: "Cost of Service",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
                height: 20.0), //I used a box as a spacer that i could control
            const Row(
              children: [
                Icon(
                  Icons.dinner_dining,
                  color: Colors.grey,
                ),
                SizedBox(width: 8.0),
                Text('  How was the service?:',
                    style: TextStyle(fontSize: 18.0)),
              ],
            ),
            ListTile(
              leading: Radio(
                value: 20,
                groupValue: tipPercentage,
                onChanged: (value) {
                  setState(() {
                    tipPercentage = value as int;
                  });
                },
              ),
              title: const Text('Amazing 20%'),
            ),
            ListTile(
              leading: Radio(
                value: 18,
                groupValue: tipPercentage,
                onChanged: (value) {
                  setState(() {
                    tipPercentage = value as int;
                  });
                },
              ),
              title: const Text('Good 18%'),
            ),
            ListTile(
              leading: Radio(
                value: 15,
                groupValue: tipPercentage,
                onChanged: (value) {
                  setState(() {
                    tipPercentage = value as int;
                  });
                },
              ),
              title: const Text('Okay 15%'),
            ),
            const SizedBox(height: 18.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    Icon(
                      Icons.credit_card,
                      color: Colors.grey,
                    ),
                    SizedBox(width: 8.0),
                    Text('Round up tip', style: TextStyle(fontSize: 18.0)),
                  ],
                ),
                Switch(
                  value: roundUp,
                  onChanged: (value) {
                    setState(() {
                      roundUp = value;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Container(
              width: double.infinity,
              child: MaterialButton(
                onPressed: () {
                  calculateTip();
                },
                color: Colors.green,
                child: const Text(
                  'CALCULATE',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  'Tip amount:',
                  style: TextStyle(fontSize: 16.0),
                ),
                const SizedBox(width: 8.0),
                Text(
                  '\$${calculatedTip.toStringAsFixed(2)}', //just 2 decimals
                  style: const TextStyle(
                      fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void calculateTip() {
    double? costService =
        double.tryParse(serviceController.text); //Can be empty (null)
    if (costService == null) {
      double tip = 0;
      setState(() {
        calculatedTip = tip;
      });
      showEmptyTextBoxDialog();
    } else {
      double tip = costService * (tipPercentage / 100.0);

      if (roundUp) {
        tip = tip.ceilToDouble();
      }

      setState(() {
        calculatedTip = tip;
      });
    }
  }

  void showEmptyTextBoxDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Empty cost of service"),
            content: const Text("Enter a valid cost of service"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Okay'),
              )
            ],
          );
        });
  }
}

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}
